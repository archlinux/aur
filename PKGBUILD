# Maintainer: gogamlg3
pkgname=tg-ws-proxy-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Local MTProto proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("imagemagick")
conflicts=("tg-ws-proxy-git")
source=("https://github.com/Flowseal/tg-ws-proxy/releases/download/v$pkgver/TgWsProxy_linux_amd64"
        "https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/tags/v$pkgver/icon.ico"
        "tg-ws-proxy.desktop"
        "tg-ws-proxy.service")

sha256sums=("7cb8a93e32479afbf57c4c102ac24cf445f86a9aeb87b2ca1c1453ca5fe6c950"
            "0e228430885976ede0853c1cb22b93b21b4d0228acfdef31506161dba14fcf55"
            "b2fba8ff3ba48b447ff709c94cebcaa6be33cf8fd3e24b06f658b9156efe24db"
            "5a7b0faec2bfca5435ea31649a7f7bf8558ffb87b743ec1cf030c9f669e071d4")

_binname="TgWsProxy_linux_amd64"

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/tg-ws-proxy"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 "tg-ws-proxy.desktop" "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 "tg-ws-proxy.service" "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"
}
