# Maintainer: LukasYTTT <https://github.com/LukasYTTT>
pkgname=appinstall
pkgver=2.0.3
pkgrel=1
pkgdesc="A modern GUI for installing and managing AppImages."
arch=('x86_64')
url="https://github.com/LukasYTTT/appinstaller"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'zenity')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LukasYTTT/appinstaller/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "appinstaller-$pkgver"
  make
}

package() {
  cd "appinstaller-$pkgver"
  install -Dm755 appinstall "$pkgdir/usr/bin/appinstall"
  install -Dm644 "assets/io.github.LukasYTTT.appinstaller.desktop" "$pkgdir/usr/share/applications/io.github.LukasYTTT.appinstaller.desktop"
  install -Dm644 "assets/io.github.LukasYTTT.appinstaller.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.LukasYTTT.appinstaller.metainfo.xml"
}
