# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=world-of-goo-2
pkgver=12478.15
pkgrel=2
pkgdesc="Build bridges, grow towers, terraform terrain, and fuel flying machines in the followup to World of Goo."
arch=("x86_64")
url="https://worldofgoo2.com"
license=('custom')
depends=('libcurl-gnutls' 'fuse2')
options=(!strip)
source=("world-of-goo-2.desktop" 
        "world-of-goo-2.png" 
        "local://World_of_Goo_2-x86_64-1.0.${pkgver}.AppImage")
#noextract=("World_of_Goo_2-x86_64-1.0.${pkgver}.AppImage")

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -L "${srcdir}/World_of_Goo_2-x86_64-1.0.${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}" 

  cp -L "$srcdir/world-of-goo-2.desktop" "$pkgdir/usr/share/applications/world-of-goo-2.desktop"
  cp -L "$srcdir/world-of-goo-2.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/world-of-goo-2.png"
}

sha256sums=('5c6e07178180326f29ea53166f777f7cf52ba77353490990fc6ecb0becf31b00'
            '54ef5f65d8ad932bbe1e3d8431002ba7e9cc16d366bbfc33ef67b6eaee1e0614'
            '7ac15c0c5c5e083765d4154461d4de1f18242e8d23f473189849cf2b47c81210')
