# Maintainer: Samuel Barata <samuel_aur@sapo.pt>

pkgname=toontown-rewritten-updated
pkgver=1.2.3
pkgrel=2
pkgdesc="An MMO originally by Disney, rewritten. An account is needed to play."
arch=("x86_64")
url="https://www.toontownrewritten.com/"
license=("")
depends=("qt5-base" "openal")
makedepends=("git")
provides=("$pkgname")
conflicts=("toontown-rewritten")
replaces=("toontown-rewritten")
source=("https://cdn.toontownrewritten.com/launcher/linux/TTRLinux-v$pkgver.tar"
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
