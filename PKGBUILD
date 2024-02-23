# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=keepassxc-allow-aur-extension-origin-bin
pkgver=2.7.6
pkgrel=3
pkgdesc="Cross-platform community-driven port of Keepass password manager (binary version)"
arch=('x86_64')
url="https://keepassxc.org/"
license=('GPL')
depends=(argon2 botan curl hicolor-icon-theme libxtst
         minizip pcsclite qrencode qt5-svg qt5-x11extras libusb)
optdepends=('xclip: keepassxc-cli clipboard support under X server'
            'wl-clipboard: keepassxc-cli clipboard support under Wayland')
source=(https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('6d6d5ae08e127669c392491cdda9c03d0aeaad0aa3ea05a2b124765015ad3a01')
provides=(org.freedesktop.secrets keepassxc)
conflicts=(keepassxc)

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
