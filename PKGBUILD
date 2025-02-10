pkgname=ZUGFeRD-Manager
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
source=(https://github.com/OpenIndex/ZUGFeRD-Manager/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz)
source=("${pkgname}.desktop")
noextract=()
sha256sums=('0de0d22331248379027412381448e9afdc86149337d0d7fef20d6f51e37532dd')


package() {
	install -Dm755 "${srcdir}/${pkgname}/bin/${pkgname}"* -t "${pkgdir}/usr/share/${pkgname}/bin"

	install -d "${pkgdir}/usr/share/${pkgname}/lib"
	cp -r "${srcdir}/${pkgname}/lib/"* -t "${pkgdir}/usr/share/${pkgname}/lib"
	
	mkdir m644 -p "${pkgdir}/usr/bin/"
	ln -s "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/"


	install -d "${pkgdir}/usr/share/applications/"
	install -m644 *.desktop -t "${pkgdir}/usr/share/applications/"

	install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
	install -m644  "${srcdir}/${pkgname}/lib/"*.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

}
