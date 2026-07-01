# Maintainer: Jonathan Lahav <j.lahav@gmail.com>

pkgname=appearance-mode
pkgver=0.1.0
pkgrel=1
pkgdesc="Light and dark appearance mode helper for XFCE"
arch=('x86_64')
url="https://github.com/SoleSoul/appearance-mode"
license=('MIT')
depends=(
  'gsettings-desktop-schemas'
  'gtk3'
  'xdg-desktop-portal-gtk'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b5c30d6fa64f6301ef74931d42ac6c6f87fd73367af5110081b4c885bb618b1')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
