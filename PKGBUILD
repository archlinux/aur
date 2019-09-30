# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.59.17
pkgrel=1
pkgdesc='Official Tutanota email client'
arch=('x86_64')
url='https://tutanota.com/blog/posts/desktop-clients/'
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('fuse' 'zenity')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::https://mail.tutanota.com/desktop/${pkgname}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums=('f4963dd04a55b2ee3ef6d2145ba329a2ee148ef41f240c5ca9970e953e14afc64cfbe2ae5ed445052874146b4e148e386b4c47fa1ac635c5bb6e0b70b84eb896')
#install="tutanota-desktop-linux.install"

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  # Saving the below for later
  #install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
