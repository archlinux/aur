# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
pkgname=ttf-poppins
pkgver=4.003
pkgrel=1
pkgdesc='Poppins font by ITFoundry'
arch=('any')
url='https://github.com/itfoundry/poppins'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-poppins.install
source=("https://github.com/itfoundry/Poppins/archive/v${pkgver}.zip")
sha256sums=('c7ba1cef54d498b851527234c0c3f028fa155b750aadd78247cb8ce80f0211e4')

package() {
  cd ${srcdir}/Poppins-${pkgver}/products/
  bsdtar -xf Poppins-${pkgver}-GoogleFonts-OTF.zip 
  install -dm 755 "${pkgdir}"/usr/share/fonts/OTF
  install -m 644 *.otf "${pkgdir}"/usr/share/fonts/OTF/
}
