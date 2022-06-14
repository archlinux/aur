# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at protonmail dot com>

pkgname=substance-sampler
pkgver=3.3.1
pkgrel=1
_rc=rc.1
_build=1925
_tag=5b18d6fb
pkgdesc="Transform a real-life picture into a photorealistic surface or HDR environment."
arch=('x86_64')
url='https://www.adobe.com/products/substance3d-sampler.html'
license=('custom')
depends=('libicu50' 'fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
replaces=('substance-alchemist')
source=("https://download.substance3d.com/adobe-substance-3d-sampler/3.x/Adobe_Substance_3D_Sampler-${pkgver}-${_rc}-${_build}-linux-x64-standard-Release-${_tag}.rpm")
sha256sums=('ba184664411b53b5f3548c7e4aa582c57d8b4a29b2277ec06989483493d90e9e')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-Adobe_Substance_3D_Sampler.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-x.adobe.substance3d.sampler.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/icons/sa_appicon_256.png"

  mv "${pkgdir}/usr/share/icons/sa_appicon_256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Sampler.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler" "${pkgdir}/opt/Adobe/"
}
