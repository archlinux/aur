# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=world-of-goo-2
pkgver=13211.7
pkgrel=1
pkgdesc="Build bridges, grow towers, terraform terrain, and fuel flying machines in the followup to World of Goo."
arch=("x86_64")
url="https://worldofgoo2.com"
license=('custom')
depends=('libcurl-gnutls' 'fuse2')
options=(!strip)
source=("world-of-goo-2.desktop" 
        "world-of-goo-2.png" 
        "hib://World_of_Goo_2-x86_64-1.0.${pkgver}.AppImage")
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

sha256sums=('4c2010033b9e69d32ba7e61b042b12ca0302bc4c0ce87517a6f1fb129614cf8e'
            '54ef5f65d8ad932bbe1e3d8431002ba7e9cc16d366bbfc33ef67b6eaee1e0614'
            '396335a177de0404b508691db3a29fd2cb4bff01dc0868c7969094efb8f6e082')
