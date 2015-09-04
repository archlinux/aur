# Maintainer: Riley Trautman <asonix.dev@gmail.com>

pkgname=toontown-rewritten
pkgver=1.2.0
pkgrel=1
pkgdesc="An MMO originally by Disney, rewritten. An account is needed to play."
arch=("x86_64")
url=""
license=("")
depends=("qt5-base")
makedepends=("git")
provides=("$pkgname")
source=("https://download.toontownrewritten.com/launcher/linux/TTRLinux-v$pkgver.tar.gz"
        "qt.conf" "toontown-rewritten.sh" "toontown-rewritten.desktop")
options=(!strip)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

package() {
  mkdir -p "$pkgdir"/opt/toontown-rewritten
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications

  install -m755 Toontown\ Rewritten/Launcher "$pkgdir"/opt/toontown-rewritten/Launcher
  install qt.conf "$pkgdir"/opt/toontown-rewritten/qt.conf
  install -m755 ../toontown-rewritten.sh "$pkgdir"/usr/bin/toontown-rewritten
  install -m755 ../toontown-rewritten.desktop "$pkgdir"/usr/share/applications/toontown-rewritten.desktop
}
