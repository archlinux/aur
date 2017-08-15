# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgname=python-cddb-git
_pkgname=python-cddb
pkgver=r3.4468996
pkgrel=1
pkgdesc='CDDB-Server access from Python'
arch=('any')
url="https://github.com/cbxbiker61/${_pkgname}"
license=('GPL-v2')
depends=('python')
provides=('python-cddb')
replaces=('python-cddb')
source=("git+https://github.com/cbxbiker61/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
