# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-vfs-perl
pkgver=1.084
pkgrel=1
pkgdesc="Gnome2-VFS perl bindings for gnome-vfs"
arch=(i686 x86_64)
license=('LGPL')
url="https://metacpan.org/pod/Gnome2::VFS"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl' 'gnome-vfs' 'perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/X/XA/XAOC/Gnome2-VFS-${pkgver}.tar.gz)
md5sums=('1dada72fb56a97e3397c9cb4304f81ab')

build() {
  cd Gnome2-VFS-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  PERL_USE_UNSAFE_INC=1 make
}

package() {
  cd Gnome2-VFS-$pkgver
  make DESTDIR="${pkgdir}" install
}
