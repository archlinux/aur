pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.5
pkgrel=3
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('any')
url="https://github.com/AlexVIM1/sequoia"
license=('GPLv3')
makedepends=('qt5-base')
source=("https://raw.githubusercontent.com/AlexVIM1/sequoia/pkg/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('aee06491219fa28668ce773f554afde6')
build() {
    cd ${srcdir}/build/src
    qmake
    make
}
package() {
    cd ${srcdir}/build/src
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 SequoiaRedactor "${pkgdir}/usr/bin"
	install -Dm755 ../res/sequoia-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 sequoia-redactor.desktop "${pkgdir}/usr/share/applications"
}
