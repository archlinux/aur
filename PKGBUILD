# Maintainer: Martin Baillie <martin.t.baillie;gmail>

pkgname=cw
pkgver=1.0.16
pkgrel=1
pkgdesc='A non-intrusive real-time ANSI color wrapper for common unix-based commands'
url='http://cwrapper.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://cwrapper.sourceforge.net/cw-${pkgver}.tar.gz")
sha256sums=('768824c16d6ad6201dc528c7b596f9577c0eca8b43ed9a3c356c374e64c2b535')

package() {
    cd "${pkgname}-${pkgver}"
    CPPFLAGS="" ./configure --prefix=/usr
    mkdir -p "${pkgdir}/"{/usr/bin,/usr/lib,/usr/share/man/man1}
    make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}

# vim:set ts=2 sw=2
