# Maintainer: Bet4 <0xbet4@gmail.com>

pkgname=udbserver
pkgver=0.1.0
pkgrel=1
pkgdesc="Unicorn Emulator Debug Server"
arch=(x86_64)
url="https://github.com/bet4it/udbserver"
license=(MIT)
depends=(unicorn-git)
makedepends=(cargo cargo-c)
source=("https://github.com/bet4it/udbserver/archive/${pkgver}.tar.gz")
sha256sums=('cf90ea5ede2e18cf20e71236d78680d8380ca83f4d395dcfd8a0e776cf89d80e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo cbuild --release --prefix /usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo cinstall --release --prefix /usr --destdir "${pkgdir}"
}

