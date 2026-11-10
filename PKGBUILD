# Maintainer: Valens.dev <info@valens.dev>
pkgname=shotivo-bin
pkgver=1.0.1
pkgrel=1
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
sha256sums_x86_64=('5d469f83dbe42bbaeb9edd6ae9656d2cb77ff4208713d9e73e163e53fb477f51')
sha256sums_aarch64=('d7e4cf6bee46bba068007d49b1af7f9cfd19bf09920c825b63e19cafecb5728e')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    cp -a "$srcdir/etc" "$pkgdir/"
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
