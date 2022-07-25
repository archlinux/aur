# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=livebot-bin
_pkgver=1.1.5-alpha
pkgver=$(echo $_pkgver | sed s/-.*$//)
pkgrel=1
pkgdesc="An app that allows you to be inside a Discord bot! "
arch=("x86_64")
url="https://github.com/SebOuellette/LiveBot"
license=("Apache")
source=("https://github.com/SebOuellette/LiveBot/releases/download/v1.1.5-alpha/livebot-linux-x64.tar.gz" "livebot.desktop")
sha256sums=("c3f12fdb4d47940f721a826aa27e9de85e9b1ab09f183b7d9756756d47f2a725" "SKIP")

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
