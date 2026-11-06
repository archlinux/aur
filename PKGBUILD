# Maintainer: Valens.dev <info@valens.dev>
pkgname=shotivo-bin
pkgver=1.0.0
pkgrel=3
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
sha256sums_x86_64=('e1d046e09b08b15c675dd45e1b4524f9cc5462f33637b01f9ad71e11b6984078')
sha256sums_aarch64=('3ba13456106b85d6d25d787a644910341eb0d525d9bed3f3e2c516eae2db7a0')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    cp -a "$srcdir/etc" "$pkgdir/"
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
