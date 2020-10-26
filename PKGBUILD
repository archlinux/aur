pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.5
pkgrel=4
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('any')
url="https://github.com/AlexVIM1/sequoia-redactor"
license=('GPLv3')
makedepends=('qt5-base')
source=("https://github.com/AlexVIM1/sequoia-redactor/raw/master/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('33b60550004fe127b72f6cd9583ad34b')
build() {
        cd ${srcdir}/src
        qmake
    	make
}
package() {
    	cd ${srcdir}/src
        mkdir -p "${pkgdir}/usr/bin/"
        mkdir -p "${pkgdir}/usr/share/applications"
        mkdir -p "${pkgdir}/usr/share/pixmaps"
        install -Dm755 SequoiaRedactor "${pkgdir}/usr/bin"
        install -Dm755 ../res/sequoia-redactor.png "${pkgdir}/usr/share/pixmaps"
        install -Dm755 ../res/sequoia-redactor.desktop "${pkgdir}/usr/share/applications"
}
