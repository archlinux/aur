# Maintainer: t-ask <t-ask-aur at cixera.com>
# Contributor: Oscar Morante <spacepluk@gmail.com>
# Contributor: Dragoon Aethis <dragoon@dragonic.eu>
# Co-maintainer: Robbie Powell <lehthanis@gmail.com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at protonmail dot com>

pkgname=substance-painter
pkgver=8.1.0
_build=1699
pkgrel=1
pkgdesc="3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://download.substance3d.com/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4' 'libxcrypt-compat')
options=('!strip') # PNG assets here should be left untouched!

source=("https://download.substance3d.com/adobe-substance-3d-painter/8.x/Adobe_Substance_3D_Painter-${pkgver}-${_build}-linux-x86_64-standard.rpm")
sha256sums=('821aac896d49903e869748604c2346ef6bebabdadaaf20da3eaaf2e97f27ecab')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Painter/resources/adobe-Adobe_Substance_3D_Painter.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Painter/resources/adobe-x.adobe.substance3d.painter.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Painter/resources/icons/painter-256x256.png"

  mv "${pkgdir}/usr/share/icons/painter-256x256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Painter.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Painter" "${pkgdir}/opt/Adobe/"
}
