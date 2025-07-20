# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
depends=('rust' 'cargo' 'xclip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('cca98ca57587605126381be073c598d964baf1687344fc2501a4f77171c2d33b5124eb79ab15c8cd30e960d99d757223c7f6c31cbe88a669472feda097bd80c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgbin" "$pkgdir/usr/bin/$pkgbin"
}
