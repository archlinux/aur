# Maintainer: William Grieshaber <me@zee.li>
# Contributor:	Mark Coolen	<mark dot coolen at gmail dot com>

pkgname=powder-toy-static
pkgver=90.2
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox,simulates air pressure, velocity & heat! - Static version"
arch=('i686' 'x86_64')
depends=('sdl' 'lua' 'fftw')
url="http://powdertoy.co.uk/"
license=('GPL3')
source=('http://powdertoy.co.uk/Download/powder-lin32.zip'
	${pkgname}.desktop ${pkgname}.png)
sha512sums=('35f998917c0b940f7d7b07c0f84ed75c7f684de0089f90403d6fd4b3234aad56831e1d52f7f16ae107fcbc1133bdd7622f3ca9fe26853ea12039249b43b40dbd'
            'a1096c82db075423f1c054e5a7914e334569df6e04fbd7dedef56d869738e2b816cfce9dc91f335482bcf9d9d55cb19b05b111423460eff98e31433269a86d6a'
            'c3b37100478cb255e3dc9ac8c7f4be5cea026a3e88ac3a0bf30e98cb7f95ee6c441a022f424f731e9e1356abc38d68559d746d2c1995c99f4cc9c1ce461aaa00')

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  install -Dm 755 "${srcdir}/powder" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "${srcdir}/powder-legacy" "${pkgdir}/usr/bin/${pkgname}-legacy"

  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
}
