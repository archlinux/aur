# Maintainer: networkException <git@nwex.de>

pkgname=ungoogled-chromium-bin
pkgver=105.0.5195.102
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=('chromium')
conflicts=('chromium')
source=(https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('27f3e7ec1c0bbe4eb0c20f0d2d857d4c50b2c4d943df7410c1bca26d5270b887')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"

    chown root "$pkgdir/usr/lib/chromium/chrome-sandbox"
    chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
