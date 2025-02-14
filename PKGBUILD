pkgname=zugferd-manager
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Desktop-Anwendung zur Erstellung und Überprüfung von E-Rechnungen im ZUGFeRD-Format."
arch=("x86_64")
url="https://github.com/OpenIndex/ZUGFeRD-Manager/"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
backup=()
options=()
install=
changelog=
source=(https://github.com/OpenIndex/ZUGFeRD-Manager/releases/download/v$pkgver/ZUGFeRD-Manager-$pkgver-linux-x64.tar.gz
"zugferd-manager.desktop")
noextract=()
sha256sums=('f1f9b056a3dab326c690e039a3e66875b56489766d8244d7628a1845c57e4b89'
            '0de0d22331248379027412381448e9afdc86149337d0d7fef20d6f51e37532dd')

package() {
	install -Dm755 "${srcdir}/ZUGFeRD-Manager/bin/ZUGFeRD"* -t "${pkgdir}/usr/share/${pkgname}/bin"

	install -d "${pkgdir}/usr/share/${pkgname}/lib"
	cp -r "${srcdir}/ZUGFeRD-Manager/lib/"* -t "${pkgdir}/usr/share/${pkgname}/lib"
	
	mkdir m644 -p "${pkgdir}/usr/bin/"
	ln -s "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/"


	install -d "${pkgdir}/usr/share/applications/"
	install -m644 *.desktop -t "${pkgdir}/usr/share/applications/"

	install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
	install -m644  "${srcdir}/ZUGFeRD-Manager/lib/"*.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

}
