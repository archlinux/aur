# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at protonmail dot com>

pkgname=substance-sampler
pkgver=3.3.2
pkgrel=1
_rc=rc.1
_build=1989
_tag=d7d12da5
pkgdesc="Transform a real-life picture into a photorealistic surface or HDR environment."
arch=('x86_64')
url='https://www.adobe.com/products/substance3d-sampler.html'
license=('custom')
depends=('libicu50' 'fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
replaces=('substance-alchemist')
source=("https://download.substance3d.com/adobe-substance-3d-sampler/3.x/Adobe_Substance_3D_Sampler-${pkgver}-${_rc}-${_build}-linux-x64-standard-Release-${_tag}.rpm")
sha256sums=('d86b33aeab19e6938f6f1fb0c369220f2bc3f411086d3e4a414ad9fed3b32541')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-Adobe_Substance_3D_Sampler.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-x.adobe.substance3d.sampler.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/icons/sa_appicon_256.png"

  mv "${pkgdir}/usr/share/icons/sa_appicon_256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Sampler.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler" "${pkgdir}/opt/Adobe/"
}
