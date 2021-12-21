# Maintainer: t-ask <t-ask-aur at cixera.com>

pkgname=substance-sampler
pkgver=3.1.2
pkgrel=1
_rc=rc.2
_build=1068
_tag=033aea86
pkgdesc="Transform a real-life picture into a photorealistic surface or HDR environment."
arch=('x86_64')
url='https://www.adobe.com/products/substance3d-sampler.html'
license=('custom')
depends=('libicu50' 'fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
replaces=('substance-alchemist')
source=("https://download.substance3d.com/adobe-substance-3d-sampler/3.x/Adobe_Substance_3D_Sampler-${pkgver}-${_rc}-${_build}-linux-x64-standard-Release-${_tag}.rpm")
sha256sums=('367546e16807e3ca80d9f2593acb54a651d05e0f87e183513bbd4a81b36065e4')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-Adobe_Substance_3D_Sampler.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-x.adobe.substance3d.sampler.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/icons/sa_appicon_256.png"

  mv "${pkgdir}/usr/share/icons/sa_appicon_256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Sampler.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler" "${pkgdir}/opt/Adobe/"
}
