# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
pkgname=mousetrap
pkgver=3.0.4
pkgrel=2
pkgdesc="An X11 utility that hides the mouse pointer after a specified interval of time"
arch=('any')
url="https://github.com/eazar001/mousetrap"
license=('MIT')
depends=('python-xlib' 'libx11' 'libxfixes')
makedepends=()
provides=('mousetrap')
backup=()
options=()
install=mousetrap.install
source=("https://github.com/eazar001/$pkgname/archive/$pkgver.tar.gz")
md5sums=('bf094bdbe2fa54b08dbe94f42b99bac9')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
