# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=livebot-bin
_pkgver=1.3.0-alpha
pkgver=$(echo $_pkgver | sed s/-.*$//)
pkgrel=1
pkgdesc="An app that allows you to be inside a Discord bot! "
arch=("x86_64")
url="https://github.com/SebOuellette/LiveBot"
license=("Apache")
source=("https://github.com/SebOuellette/LiveBot/releases/download/v1.3.0-alpha/livebot-linux-x64.tar.gz" "livebot.desktop")
sha256sums=("a01fd0cd16609434a1bfa5347eb0dd7c04fbe85685a5965f4806f9b3f9cee26c" "SKIP")

package() {
  mkdir -p "$pkgdir/usr/share"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r livebot-linux-x64 "$pkgdir/usr/share/livebot"
  ln -s "/usr/share/livebot/LiveBot" "$pkgdir/usr/bin/livebot"
  ln -s "/usr/share/livebot/resources/app/resources/icons/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/livebot.png"
  cp "$srcdir/livebot.desktop" "$pkgdir/usr/share/applications"
}
