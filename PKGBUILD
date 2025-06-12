# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Rain Shinotsu <Rain_Shinotsu at protonmail dot com>

pkgname=substance-sampler
pkgver=3.4.0
pkgrel=2
_rc=rc.3
_build=2229
_tag=3dd2456e
pkgdesc="Transform a real-life picture into a photorealistic surface or HDR environment."
arch=('x86_64')
url='https://www.adobe.com/products/substance3d-sampler.html'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'libxml2-legacy' 'libxcrypt-compat' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil')
options=('!strip')
replaces=('substance-alchemist')
source=("https://download.substance3d.com/adobe-substance-3d-sampler/3.x/Adobe_Substance_3D_Sampler-${pkgver}-${_rc}-${_build}-linux-x64-standard-Release-${_tag}.rpm")
sha256sums=('58b211634a6a72a98321b26fd0f4824ec2fd100f0e9fadbab67d5a3f448cd95d')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-Adobe_Substance_3D_Sampler.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/adobe-x.adobe.substance3d.sampler.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler/Resources/icons/sa_appicon_256.png"

  mv "${pkgdir}/usr/share/icons/sa_appicon_256.png" "${pkgdir}/usr/share/icons/adobe-Adobe_Substance_3D_Sampler.png"
  mv "${srcdir}/opt/Adobe/Adobe_Substance_3D_Sampler" "${pkgdir}/opt/Adobe/"
}
