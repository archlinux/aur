# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.10
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
url="http://conspy.sourceforge.net/"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('ncurses')
changelog=ChangeLog
source=("http://cznic.dl.sourceforge.net/project/conspy/conspy-${pkgver}-1/conspy-${pkgver}.tar.gz")
sha256sums=('1c8357d80ef55807fddb62c223cb3779deb66aa33f31294ad6e4e2a03a81d7ee')

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
