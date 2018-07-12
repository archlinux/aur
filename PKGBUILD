# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=pylms7002m-git
_pkgname=pyLMS7002M
pkgver=r18.b866dee
pkgrel=1
pkgdesc="Python bindings for LMS7002M. Obsolete."
arch=('any')
url="https://github.com/myriadrf/pyLMS7002M"
license=('Apache')
depends=('python2-pyserial' 'python2-pyusb')
makedepends=('git')
provides=('pylms7002m')
conflicts=('pylms7002m')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/$_pkgname
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
