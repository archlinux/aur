# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=stm32cubemx
pkgver=6.6.1
pkgrel=3
epoch=
pkgdesc="graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
arch=(any)
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom')
groups=()
depends=('java-runtime=11'
	'archlinux-java-run'
	'bash')
makedepends=('imagemagick')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://sw-center.st.com/packs/resource/library/stm32cube_mx_v${pkgver//./}-lin.zip"
 	"stm32cubemx.desktop"
 	"stm32cubemx.sh")
noextract=()
sha512sums=('273ca4e96972cae1cf1b95eaf5dd8d6bc747149e8794fae96ff51301bfd212fbef41c306264d9b5d8c000e85d8c26d40125b4f79b18642de23b3bec24e9c9837'
            '56bff32e35f8eb09ae4df94e4e885aaf9349c687ce9f4901ddd11c83b69a32b19d99ab8dbd90c6679e86e7213c4d41640e52ab0d80b8fc4640a1bc5df9a3af32'
            '6a79222fecdd4e0321d4a460a746d704c25fa32a97fd6653adfb64447053b8985c9533caf2f92f8907ef4424aa19ce0bdff3911bbdc6bf744bb354baaa3d834c')
validpgpkeys=()

package() {
   cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/stm32cubemx"
	cp -r "${srcdir}/MX/." "${pkgdir}/opt/stm32cubemx"
	install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgname}"
	#icon and desktop file
	convert "${srcdir}/MX/help/STM32CubeMX.ico[0]" "${srcdir}/MX/${pkgname}.png"
	install -Dm 644 "${srcdir}/MX/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	#license
	install -Dm 644 "${srcdir}/MX/help/software_license_agreement.pdf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
