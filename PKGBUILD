# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at protonmail dot com>

pkgname=substance-sampler
pkgver=3.3.0
pkgrel=1
_rc=rc.3
_build=1780
_tag=722e7a0f
pkgdesc="Transform a real-life picture into a photorealistic surface or HDR environment."
arch=('x86_64')
url='https://www.adobe.com/products/substance3d-sampler.html'
license=('custom')
depends=('libicu50' 'fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
replaces=('substance-alchemist')
source=("https://download.substance3d.com/adobe-substance-3d-sampler/3.x/Adobe_Substance_3D_Sampler-${pkgver}-${_rc}-${_build}-linux-x64-standard-Release-${_tag}.rpm")
sha256sums=('1008ed9143ce53076f014210cc61adb05145808b3034798e113c4bb73238632f')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-Adobe_Substance_3D_Sampler.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-x.adobe.substance3d.sampler.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/icons/sa_appicon_256.png"

  mv "${pkgdir}/usr/share/icons/sa_appicon_256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Sampler.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler" "${pkgdir}/opt/Adobe/"
}
