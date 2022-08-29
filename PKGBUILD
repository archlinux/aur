# Maintainer: t-ask <t-ask-aur at cixera dot com>
# Co-maintainer: lehthanis <lehthanis at gmail dot com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at proton dot me>
# Contributor: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Dragoon Aethis <dragoon at dragonic dot eu>

pkgname=substance-designer
pkgver=12.2.1
pkgrel=1
_build=5947
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4' 'libxcrypt-compat')
options=('!strip') # PNG assets here should be left untouched!

source=("https://download.substance3d.com/adobe-substance-3d-designer/12.x/Adobe_Substance_3D_Designer-${pkgver}-${_build}-linux-x64-standard.rpm")
sha256sums=('b7c7e6cc3a8d015cda7e6d35e6c8b253219d94401887c9291684849a0f04aac6')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/adobe-Adobe_Substance_3D_Designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/adobe-x.adobe.substance3d.designer.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer/resources/icons/substance-256x256.png"

  mv "${pkgdir}/usr/share/icons/substance-256x256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Designer.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Designer" "${pkgdir}/opt/Adobe/"
}
