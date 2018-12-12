# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Karsten Pufahl <contact <AT> karstenpufahl.de>
pkgname=stm32cubemx
pkgver=5.0.0
pkgrel=1
epoch=
pkgdesc="graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
arch=(any)
url="https://www.st.com/content/st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-configurators-and-code-generators/stm32cubemx.html"
license=('custom')
groups=()
depends=('java-runtime'
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
source=("https://www.st.com/resource/en/library2/stm32cube_mx_v${pkgver//./}.zip"
 	"LICENSE"
 	"stm32cubemx.desktop"
 	"stm32cubemx.sh")
noextract=()
sha512sums=('7b793bcb6cfe1bac42ea9a4d47b0957980d028cd9043564867237aba24c34207e97edaab87973ebe604d18ebbbc3be7deded6402fce22d2be33e5083cc49aec5'
            'ad1897ea5234b712d726b5d3423f05f1c0c5a64e28354afe07dce7451563ae4492366cc252ca379b44793797be20011a66458431fd5453c18a7543ccb8df5397'
            '56bff32e35f8eb09ae4df94e4e885aaf9349c687ce9f4901ddd11c83b69a32b19d99ab8dbd90c6679e86e7213c4d41640e52ab0d80b8fc4640a1bc5df9a3af32'
            '9cc2dcb57e48e7039fb833c410e4638155fd14793c6daa7a00e1d1445162e7e26690c3303b6f052fff643123bc246be345da8624b18ee2805ddde75280512eec')
validpgpkeys=()

package() {
   cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/stm32cubemx"
	cp -r "${srcdir}/." "${pkgdir}/opt/stm32cubemx"
   install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgname}"
	#icon and desktop file
	convert "${srcdir}/help/STM32CubeMX.ico" "${srcdir}/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}-6.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	#license
	install -Dm 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
