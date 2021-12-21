# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-designer
pkgver=11.3.1
pkgrel=1
_build=5355
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip') # PNG assets here should be left untouched!

source=("https://download.substance3d.com/adobe-substance-3d-designer/11.x/Adobe_Substance_3D_Designer-${pkgver}-${_build}-linux-x64-standard.rpm")
sha256sums=('dcfe4fc0f74a5e781689b2a3848659aa2dcbbbb97a3a6049e62d2574ace668cf')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/adobe-Adobe_Substance_3D_Designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/adobe-x.adobe.substance3d.designer.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/icons/substance-256x256.png"

  mv "${pkgdir}/usr/share/icons/substance-256x256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Designer.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer" "${pkgdir}/opt/Adobe/"
}
