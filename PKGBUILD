# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=stm32cubemx
pkgver=6.8.0
pkgrel=1
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
sha512sums=('3a37967be03324e6c8ec5aab5375b3ac43afc72f88d9d8fe93c6436ee1b72b7775c4004f5ad3abb51867d78457f5bb42e6fef9d8d248d080f6d9af7742f2c49d'
            '83c67bef3e8f8434903fe0c067442cc7473459386fdcb0225af1b3a75fd75e2be393f91f877c8410f1055ca4ec531b2df707fcab10663cae382a7f4066c8548b'
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
