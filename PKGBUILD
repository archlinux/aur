# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-vfs-perl
pkgver=1.082
pkgrel=8
pkgdesc="Gnome2-VFS perl bindings for gnome-vfs"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl' 'gnome-vfs-nosmb' 'perl')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gnome2-VFS-${pkgver}.tar.gz)
md5sums=('cb530d737c8f2d1023797cf0587b4e05')

build() {
  cd Gnome2-VFS-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  PERL_USE_UNSAFE_INC=1 make
}

package() {
  cd Gnome2-VFS-$pkgver
  make DESTDIR="${pkgdir}" install
}
