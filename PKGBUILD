# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=41.5.0.18815
pkgrel=1
pkgdesc="Webex for Linux"
arch=('x86_64')
url="https://www.webex.com/"
license=('custom')
depends=('binutils'
         'xdg-utils'
         'mesa'
         'nss'
         'nspr'
         'libcups'
         'upower'
         'libnotify'
         'libsecret'
         'wayland'
         'atk'
         'at-spi2-atk'
         'pango'
         'at-spi2-core'
         'krb5'
         'alsa-lib'
         'systemd-libs'
         'libpulse'
         'libxcb'
         'xcb-util-renderutil'
         'xcb-util-keysyms'
         'xcb-util-image'
         'xcb-util-wm'
         'libxkbcommon-x11')
source=("$pkgname-$pkgver.deb::https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/Webex.deb")
sha256sums=('9aae10d54026f93da034baf2b5f1167a1e6f80d7b9f6ffcd1b1b9db66e1ff274')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -Jxf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -a opt/ "$pkgdir/"
}
