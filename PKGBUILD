# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-vfs-perl
pkgver=1.082
pkgrel=5
pkgdesc="Gnome2-VFS perl bindings for gnome-vfs"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl' 'gnome-vfs' 'perl')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/Gnome2-VFS-${pkgver}.tar.gz)
md5sums=('374e7d611d080d893bb3da9d40c64733')

build() {
  cd Gnome2-VFS-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gnome2-VFS-$pkgver
  make DESTDIR="${pkgdir}" install

# template start; name=perl-binary-module-dependency; version=1;
#if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
#	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
#	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
#	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
#fi
# template end;
}
