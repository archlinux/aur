# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Alastair Hughes < hobbitalastair at yandex dot com>

pkgname='ical2html'
pkgver='3.0'
pkgrel=1
pkgdesc="Utilities to filter, merge, and generate HTML from ical files"

arch=('i686' 'x86_64' 'aarch64')
url="https://www.w3.org/Tools/Ical2html"
license=('custom')
depends=('libical')
source=("https://www.w3.org/Tools/Ical2html/${pkgname}-${pkgver}.tar.gz")
sha256sums=('97af8b53d57f4f57a5e2be6a4b3a8bcc86fc8c6c967961db0432777175b6ce22')

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
