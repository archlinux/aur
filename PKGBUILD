# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=stm32cubemx
pkgver=6.15.0
pkgrel=1
epoch=
pkgdesc="graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
arch=(any)
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom')
groups=()
depends=('java-runtime>=21'
	'archlinux-java-run>=10'
	'bash')
makedepends=('imagemagick')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
install=
changelog=
source=("https://sw-center.st.com/packs/resource/library/stm32cube_mx_v${pkgver//./}-lin.zip"
 	"stm32cubemx.desktop"
 	"stm32cubemx.sh")
noextract=()
sha512sums=('6fc1ae41047e9fba175f4f1e8d15c5b049a64bc07aa80cf2e4f3b9b3b1e342e446017e3f899ca669c8fdedfb09910c1a9e593e9be1e21524b53a4c6c645033e6'
            '83c67bef3e8f8434903fe0c067442cc7473459386fdcb0225af1b3a75fd75e2be393f91f877c8410f1055ca4ec531b2df707fcab10663cae382a7f4066c8548b'
            '031f4b55414e53ffd4ae6bca76d260629f92553ee66fe52e233de1032892925f626a3d29974976b9e5289282fc4fc0459cda47436f71ed8d3258f408562a2f6c')
validpgpkeys=()

package() {
   cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/stm32cubemx"
	cp -r "${srcdir}/MX/." "${pkgdir}/opt/stm32cubemx"
	install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgname}"
	
	#icon and desktop file
	install -Dm 644 "${srcdir}/MX/help/STM32CubeMX.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	#license
	install -Dm 644 "${srcdir}/MX/help/software_license_agreement.pdf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
