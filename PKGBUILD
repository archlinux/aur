# Maintainer: agilob <archlinux@agilob.net>
# Contributor: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-linux
pkgver=3.57.3
pkgrel=1
pkgdesc='Official Tutanota email client'
arch=('x86_64')
url='https://tutanota.com/blog/posts/desktop-clients/'
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::https://mail.tutanota.com/desktop/${pkgname}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums=('c5af5730895fa0e045a1797ede00002437a1b4f389eb7b19a4e7e4005b027cb2aaf417c0f9c49bc1db63b8983f3bdb6d54227e65dc0d3f82ef050c830e10591b')
#install="tutanota-desktop-linux.install"

check () {
  # This won't be here forever; needed to transition the packaging
  printf "\n\nNOTE: If you run in to an error upgrading this package, please execute the command 'rm /usr/bin/tutanota-desktop-linux' as root and try the upgrade again.\n\n"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  # Saving the below for later
  #install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
