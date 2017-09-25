# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=quasselgrep
pkgname=$_pkgname-git
pkgver=r74.g502c88b
pkgrel=1
pkgdesc='Tool for searching quassel logs from the commandline'
arch=('any')
url='https://github.com/fish-face/quasselgrep'
license=('GPL')
depends=('python2-setuptools' 'python2-dateutil' 'python2-crypto')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/fish-face/quasselgrep.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  python2 setup.py install --root="$pkgdir" --optimize=1
}
