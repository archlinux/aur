pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.4
pkgrel=1
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('x86_64')
url="https://github.com/AlexVIM1/sequoia"
license=('GPLv3')
depends=('qt5-base')
checkdepends=()
install=
changelog=
source=("https://raw.githubusercontent.com/AlexVIM1/sequoia/master/${_pkgname}-${pkgver}-${arch}.tar.gz")
md5sums=('9a2c0b87cae543d1bd7d37e90530cfc7')
build() {
    cd ${srcdir}/build
    qmake
    make
}
package() {
    cd ${srcdir}/build
	make INSTALL_ROOT="$pkgdir" install
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp -a . "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 SequoiaRedactor "${pkgdir}/usr/bin"
	install -Dm755 sequoia-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 sequoia-redactor.desktop "${pkgdir}/usr/share/applications"
}
