# Maintainer: Alastair Hughes < hobbitalastair at yandex dot com>

# Package information
pkgname='ical2html'
pkgver='2.1'
pkgrel=1
pkgdesc="Utilities to filter, merge, and generate HTML from ical files"

arch=('i686' 'x86_64')
url="http://www.w3.org/Tools/Ical2html"
license=('custom')
depends=('libical')
source=("http://www.w3.org/Tools/Ical2html/${pkgname}-${pkgver}.tar.gz")
md5sums=('bf0bb0e590aef266694b66a741d86191')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix="/usr"
    make
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}/" install

    install -Dm0644 COPYING \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
