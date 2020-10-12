# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fractus-atlas
pkgver=1.14.0
pkgrel=1
pkgdesc="An image viewer which allows you to quickly move them in folders"
url="https://github.com/Jimskapt/fractus-atlas"
arch=('x86_64')
license=('custom')
depends=('webkit2gtk')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jimskapt/fractus-atlas/archive/${pkgver}.tar.gz")
sha256sums=('a2f736db72d45c09fde16be34b75767639cfc48d1da568c4f5e08548049b1d4f')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}/target/release"
  install -Dm755 fractus-atlas "${pkgdir}/usr/bin/fractus-atlas"
}
