# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.60.6
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
sha512sums=('bd426199414306a30274c25deb7124586ca3e028cf102642a41b9a72ad91e47cf6f7858b3038630c91bceac4a7e6e1866a2dbf3c5a20008125c186973d8377d2')
#install="tutanota-desktop-linux.install"

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  # Saving the below for later
  #install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
