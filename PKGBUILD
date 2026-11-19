# Maintainer: Akusen <akudesyn@gmail.com>
pkgname=sinestesia
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio visualizer for Linux, a Genoma app in Bioma's style"
arch=('any')
url="https://github.com/AkusenArcade/Sinestesia"
license=('MIT')
# genoma cattura l'audio (genoma spectrum, PipeWire) e disegna tutto.
depends=('genoma>=0.1.21' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cc947a079f534dd545a8813182513880df7545c465490c7276efd7245e508dc')

package() {
  cd "Sinestesia-$pkgver"
  install -dm755 "$pkgdir/usr/share/sinestesia"
  cp -r genoma/. "$pkgdir/usr/share/sinestesia/"
  install -Dm755 sinestesia                       "$pkgdir/usr/bin/sinestesia"
  install -Dm644 "dev.akusen.sinestesia.desktop" "$pkgdir/usr/share/applications/dev.akusen.sinestesia.desktop"
  install -Dm644 "assets/sinestesia.svg"         "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.akusen.sinestesia.svg"
  install -Dm644 "LICENSE"                        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
