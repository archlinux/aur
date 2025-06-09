pkgname=zugferd-manager
pkgver="1.3.2"
pkgrel="1"
pkgdesc="Desktop-Anwendung zur Erstellung und Überprüfung von E-Rechnungen im ZUGFeRD-Format."
arch=("x86_64")
url="https://github.com/OpenIndex/ZUGFeRD-Manager/"
license=('Apache-2.0')
groups=()
depends=(jdk-openjdk)
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
sha256sums=('e738495353c02f32f95d639ac3ff59a739a0458c3d3b348f2f8fe4456f9fab12'
            '7c78cc33ffbec17981e57cf32e0189006deb1e06a00b694a1cb1473768cda822')

package() {
	install -Dm755 "${srcdir}/ZUGFeRD-Manager/bin/ZUGFeRD"* -t "${pkgdir}/opt/${pkgname}/bin"

	install -d "${pkgdir}/opt/${pkgname}/lib"
	cp -r "${srcdir}/ZUGFeRD-Manager/lib/"* -t "${pkgdir}/opt/${pkgname}/lib"
	
	mkdir m644 -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/bin/ZUGFeRD-Manager" "${pkgdir}/usr/bin/${pkgname}"


	install -d "${pkgdir}/usr/share/applications/"
	install -m644 *.desktop -t "${pkgdir}/usr/share/applications/"

	install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
	install -m644  "${srcdir}/ZUGFeRD-Manager/lib/"*.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

}
