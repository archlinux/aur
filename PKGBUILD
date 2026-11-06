# Maintainer: Valens.dev <info@valens.dev>
pkgname=shotivo-bin
pkgver=1.0.0
pkgrel=4
pkgdesc="Free screenshots. Free sharing. (precompiled)"
arch=('x86_64' 'aarch64')
url="https://shotivo.app"
license=('custom:proprietary')
depends=('gtk4' 'libadwaita' 'pipewire' 'xorg-xwayland' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
optdepends=('wlroots: window capture on wlroots compositors via wlrctl'
            'kwin: window capture on KDE Plasma')
provides=('shotivo')
conflicts=('shotivo' 'shotivo-git')
options=('!strip' '!emptydirs')
backup=('etc/xdg/autostart/dev.valens.shotivo.desktop')

source_x86_64=("shotivo-${pkgver}-linux-x86_64.tar.gz::https://shotivo.app/downloads/releases/${pkgver}/linux/x86_64/shotivo-linux-x86_64.tar.gz")
source_aarch64=("shotivo-${pkgver}-linux-aarch64.tar.gz::https://shotivo.app/downloads/releases/${pkgver}/linux/aarch64/shotivo-linux-aarch64.tar.gz")
sha256sums_x86_64=('4f1fc46df7aa413e5e17e634a33535cb6d6b016ceca54d5452e9965e0f3bc93c')
sha256sums_aarch64=('5040a6e87d2ae9e5c42df7e82cde29c7861ddb6b52d1c15db526e910d05f9e3f')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    cp -a "$srcdir/etc" "$pkgdir/"
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
