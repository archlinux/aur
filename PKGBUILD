# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=pylms7002m
pkgver=r18.b866dee
pkgrel=1
pkgdesc="Python bindings for LMS7002M. Obsolete."
arch=(any)
url="https://github.com/myriadrf/pyLMS7002M"
license=('Apache')
depends=('python-pyserial' 'python-pyusb')
makedepends=('git')
provides=('lime-tools')
conflicts=('lime-tools')
source=("git+$url")
md5sums=('SKIP')

_rname=pyLMS7002M

pkgver() {
  cd $srcdir/$_rname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_rname
  python2 setup.py build
}

package() {
  cd $srcdir/$_rname
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
