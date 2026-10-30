# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=2026.02.22_071121_683c119a6
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Free Persian book on the Go programming language"
arch=('x86_64' 'aarch64')
url="https://github.com/GoFarsi/book"
license=('CC0-1.0')
provides=('gofarsi' 'gofarsi-book')
conflicts=('gofarsi-book')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${_pkgver}/book_${_pkgver}_linux_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${_pkgver}/book_${_pkgver}_linux_arm64.deb")
sha256sums_x86_64=('833c09f220c40914c08e00f2a375fc8ebae9d2a9bc495e498e9a57e66928f027')
sha256sums_aarch64=('953eb73298293be6e2a3a19f57830abc576dfb08539bef5cca4b4ce86665d3d2')

package() {
  bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.deb" data.tar.gz
  bsdtar -xf data.tar.gz ./usr/local/bin/book
  install -Dm755 usr/local/bin/book "${pkgdir}/usr/bin/gofarsi-book"
}
