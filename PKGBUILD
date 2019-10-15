# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.60.7
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
sha512sums=('3bfaab57eb52784ec47e3bc666ccd64a562dca8080732d5ce0a17437fa7a5242230eb2f0afa5c361ac651b4bc68a0fd1fa283564a1143ac925843447ffb75e52')
#install="tutanota-desktop-linux.install"

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  # Saving the below for later
  #install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
