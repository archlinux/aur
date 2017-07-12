# Maintainer:  chet <chetgurevitch @ protonmail . com>
# Contributor: saulhidalgoaular <saulhidalgoaular @ gmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: pyropeter <abi1789 @ gmail . com>
# Contributor: darkheart <fumbles @ ymail . com>
# Contributor: zerathidune <zerathidune @ gmail . com>

pkgname=bluej
pkgver=4.1.0
pkgrel=1
pkgdesc="An integrated Java environment specifically designed for introductory teaching"
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2.1' 'MIT' 'custom')
depends=('java-runtime' 'java-environment' 'java-openjfx')
source=("https://www.${pkgname}.org/download/files/BlueJ-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop")
noextract=("BlueJ-linux-${pkgver//.}.deb")
sha256sums=('20ba5f5ede6c12857be41e417a03e59f44a175428f28c0c15155291c10a706c6'
            '1706b230ea1aabc9a6c5ec87cc4520f0b82c7ae15c6ab71dea46e26485c54c15'
            'd48f47e2a16cef483ded299e37016a5172829303fc6ac43cab486049e9f61711')

package() {
cd "${srcdir}"
ar p "BlueJ-linux-${pkgver//.}.deb" data.tar.xz | tar xJ

mkdir -p "${pkgdir}/opt/${pkgname}"
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples"

cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
cp -r usr/share/doc/BlueJ/*/ "${pkgdir}/usr/share/doc/${pkgname}/examples"

install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
install -Dm644 usr/share/doc/BlueJ/README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
install -Dm644 usr/share/doc/BlueJ/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -Dm644 usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
