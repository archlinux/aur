# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=nrftool
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool to flash and erase nRF devices"
arch=('any')
url="https://github.com/pauloborges/nrftool"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pauloborges/nrftool/archive/v$pkgver.tar.gz")
sha256sums=('b23a1bb6a0cb9805b4cdcdc671de8fbe7dae03eaa944f5b7771c73401314f8dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
