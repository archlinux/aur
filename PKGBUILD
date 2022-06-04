# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-perl
pkgver=1.048
pkgrel=1
pkgdesc="Perl bindings for libgnome"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://metacpan.org/dist/Gnome2"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gnomecanvas-perl' 'gnome-vfs-perl' 'libgnomeui' 'perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/X/XA/XAOC/Gnome2-${pkgver}.tar.gz)
md5sums=('38408e8195e86b1dda0704a0054ae5a8')

build() {
  cd Gnome2-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  PERL_USE_UNSAFE_INC=1 make
}

package() {
  cd Gnome2-$pkgver
  make DESTDIR="${pkgdir}" install
}
