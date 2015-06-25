# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=pcal
pkgver=4.11.0
pkgrel=3
pkgdesc="Pcal is a calendar-generation program which produces nice-looking PostScript output"
url="http://pcal.sourceforge.net/"
license=('unknown')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tgz")
md5sums=('0ed7e9bec81fe3bdd62f8af283bef704')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Note the usage of $PACK, because the Makefile uses "compress" by
  # default, which doesn't exist on Arch. Besides, makepkg handles
  # manpage compression itself.
  make \
    PACK=":" \
    DESTDIR="${pkgdir}" \
    BINDIR="/usr/bin" \
    MANDIR="/usr/share/man/man1" \
    CATDIR="/usr/share/man/cat1" \
    install
}
