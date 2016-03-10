# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=oxipng
pkgver=0.2.1
pkgrel=1
pkgdesc="A lossless PNG compression optimiser"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'arm' 'aarch64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shssoichiro/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('f0a3d7040ca28b25c658df58248cf855')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/oxipng "$pkgdir/usr/bin/oxipng"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
