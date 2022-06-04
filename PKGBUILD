# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnomecanvas-perl
_realname=Gnome2-Canvas
pkgver=1.006
pkgrel=1
pkgdesc="Gnome2-Canvas perl bindings for libgnomecanvas"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://metacpan.org/pod/Gnome2::Canvas"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl' 'libgnomecanvas' 'perl')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/X/XA/XAOC/Gnome2-Canvas-${pkgver}.tar.gz)
md5sums=('61176cad7e995ec40b273766ffed3592')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  PERL_USE_UNSAFE_INC=1 make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
