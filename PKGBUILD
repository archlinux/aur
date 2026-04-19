# Maintainer: LukasYTTT <https://github.com/LukasYTTT>
pkgname=appinstall
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern GUI for installing and managing AppImages."
arch=('x86_64')
url="https://github.com/LukasYTTT/appinstaller"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'zenity')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LukasYTTT/appinstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6c72ad1f42a355e5443b96adc25ecee12fb27f761b835fce30f9f9e644449ac')

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
