# Maintainer: LukasYTTT <https://github.com/LukasYTTT>
pkgname=appinstall
pkgver=2.0.2
pkgrel=1
pkgdesc="A modern GUI for installing and managing AppImages."
arch=('x86_64')
url="https://github.com/LukasYTTT/appinstaller"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'zenity')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LukasYTTT/appinstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('489ceeb9fcb5f6765900a8ecac72ffd8110762df123e35eba9343683d8c8bc3d')

build() {
  cd "appinstaller-$pkgver"
  go build -o appinstall .
}

package() {
  cd "appinstaller-$pkgver"
  install -Dm755 appinstall "$pkgdir/usr/bin/appinstall"
  install -Dm644 "assets/io.github.LukasYTTT.appinstaller.desktop" "$pkgdir/usr/share/applications/io.github.LukasYTTT.appinstaller.desktop"
  install -Dm644 "assets/io.github.LukasYTTT.appinstaller.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.LukasYTTT.appinstaller.metainfo.xml"
}
