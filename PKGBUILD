# Maintainer: Federico Torrielli <evilscript@protonmail.com>
pkgname=orion-browser
pkgver=0.3.0
pkgrel=1
pkgdesc="Orion, a fast WebKit browser by Kagi (Linux beta). Ships and installs the official Flatpak bundle."
arch=('x86_64' 'aarch64')
url="https://orionbrowser.com/platforms/linux"
license=('LicenseRef-proprietary')
depends=('flatpak')
install="$pkgname.install"
# Bundle is built against org.gnome.Platform//49; flatpak pulls it at install time.
options=('!strip' '!debug')

source_x86_64=("oriongtk-$pkgver-x86_64.flatpak::https://orionbrowser.com/download/oriongtk.$pkgver.flatpak")
source_aarch64=("oriongtk-$pkgver-aarch64.flatpak::https://orionbrowser.com/download/oriongtk.$pkgver.arm.flatpak")
sha256sums_x86_64=('d0d3963d2d98bf93699d3c6ab2232fb211c5c93c83a2d3e2f7ae3fda883f6c2c')
sha256sums_aarch64=('67c20a6917642cb8bba45661e20185e0ecbc44fe37bc991e087fdb048cea1fc3')

package() {
  install -Dm644 "oriongtk-$pkgver-$CARCH.flatpak" \
    "$pkgdir/usr/lib/$pkgname/orion.flatpak"
}
