# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgname=python-pycdio-git
_pkgname=pycdio
pkgver=r175.d48be10
pkgrel=1
pkgdesc='Python OO interface to libcdio (CD Input and Control library)'
arch=('any')
url='http://pypi.python.org/pypi/pycdio/'
license=('GPL-v3')
depends=('python' 'libcdio')
provides=('python-pycdio')
conflicts=('python-pycdio')
replaces=('python-pycdio')
source=("git+https://git.savannah.gnu.org/git/libcdio/${_pkgname}.git")
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
