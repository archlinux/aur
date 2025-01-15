# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.547
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=("x86_64" "aarch64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
makedepends=("unzip")
depends=()
provides=("openutau")
conflicts=("openutau")
source=("openutau.sh"
        "openutau.svg"
        "openutau.desktop")
source_x86_64=("OpenUtau-linux-x86_64-$pkgver.zip::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-x64.zip")
source_aarch64=("OpenUtau-linux-aarch64-$pkgver.zip::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-arm64.zip")
sha256sums=('b7e1f13f15367a039f915b290db43d6cbb33903836cd8d73cc16d036fde3342a'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            'fb3ac0c32bf7ea057fbb4655c3aaefcee45302026d8dfff401eac86948fed950')
sha256sums_x86_64=('35a50351cdc328a3748fce345bb0a86591846eacc5daf2de8d5b7d22038dc5df')
sha256sums_aarch64=('6197ab38018996595f02f41fb36c24a8e67acd53babf044581140202403cd00b')
noextract=("$source_x86_64" "$source_aarch64")
options=(!strip)

package() {
  install -d "${pkgdir}/opt/openutau"
  unzip "${srcdir}/OpenUtau-linux-$CARCH-$pkgver.zip" -d "${pkgdir}/opt/openutau"
  install -Dm644 "${srcdir}/openutau.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openutau.svg"
  install -Dm755 "${srcdir}/openutau.sh" "${pkgdir}/usr/bin/openutau"
  install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
}
