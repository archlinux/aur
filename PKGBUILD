# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=lumins
_pkgname=LuminS
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast and reliable alternative to rsync for synchronizing local files written in Rust "
arch=('i686' 'x86_64')
url="https://github.com/wchang22/lumins"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}::https://github.com/wchang22/LuminS/archive/v${pkgver}.tar.gz")
md5sums=('0a272fd6133ed9abcdcf774fc3203c67')
sha256sums=('e5423b62f7ba525a961b4e92fd9d2afe6fb791adb383854783807c7d34c84ffb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release --locked --target-dir=./target
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 ./target/release/lms "${pkgdir}/usr/bin/lms"
  install -Dm 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

