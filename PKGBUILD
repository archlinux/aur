# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=7.4.3
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
optdepends=(
  "sane-airscan: airscan support"
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=("!strip" "!debug")
source_aarch64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.rpm")
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.rpm")
b2sums_aarch64=("fae7364baf13a231d3d6075e4f5c42c869fc28b3f2b0ccf1d68c649ac49041e988dcaadb373461d22c5a3ae865ed143bf3c38eabfd1266b18be55cbadbdb2243")
b2sums_x86_64=("2c11ddf30d91d75a541d7c3500a7d79ef4512ad393bd98065dec2365d8de763098a6665c43d0b6ac65c5e73fd2e0ad9d6190899cf306e7933626f1bd8f60bf22")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
