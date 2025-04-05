# Maintainer: Bet4 <0xbet4@gmail.com>

pkgname=udbserver
pkgver=0.2.0
pkgrel=1
pkgdesc="Unicorn Emulator Debug Server"
arch=(x86_64)
url="https://github.com/bet4it/udbserver"
license=(MIT)
depends=(unicorn)
makedepends=(cargo cargo-c)
source=("https://github.com/bet4it/udbserver/archive/v${pkgver}.tar.gz")
sha256sums=('b9f299120d07c9a45299205b8f25dd552a7267bbffb067c8d2c66c5913a7b327')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo cbuild --release --prefix /usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo cinstall --release --prefix /usr --destdir "${pkgdir}"
}
