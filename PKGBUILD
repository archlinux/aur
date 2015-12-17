# Maintainer: Serede Sixty Six <serede.dev@gmail.com>
# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.13
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
url="http://conspy.sourceforge.net/"
arch=('x86_64' 'i686' 'armv6h')
license=('AGPL3')
depends=('ncurses')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/conspy/conspy-${pkgver}-${pkgrel}/conspy-${pkgver}.tar.gz")
md5sums=('8caed1f64a618917d5143a4a5ebb48d8')

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
