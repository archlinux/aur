# Maintainer: Elrondo46 <elrond94@hotmail.com>
# Maintainer: Serede Sixty Six <serede.dev@gmail.com>
# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.14
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
url="http://conspy.sourceforge.net/"
arch=('x86_64' 'i686' 'armv6h')
license=('AGPL3')
depends=('ncurses')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/conspy/conspy-${pkgver}-${pkgrel}/conspy-${pkgver}.tar.gz")
sha256sums=('4e2f05c9e19a6673a323127711ff007f7f9244f3a5c793c2b079eb7fbb113319')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix=/usr DESTDIR="${pkgdir}" install

    _docdir="${pkgdir}/usr/share/doc/${pkgname}"
    install -dm 755 "${_docdir}"
    install -m 644 README.txt ChangeLog.txt "${_docdir}"
}
