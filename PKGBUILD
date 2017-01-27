# $Id$
# Maintainer: PhotonX <photon89@googlemail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnomecanvas-perl
_realname=Gnome2-Canvas
pkgver=1.002
pkgrel=15
pkgdesc="Gnome2-Canvas perl bindings for libgnomecanvas"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl' 'libgnomecanvas' 'perl')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('93405a987ba4bbd03c2f91592b88f5cb')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"

# template start; name=perl-binary-module-dependency; version=1;
#if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
#	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
#	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
#	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
#fi
# template end;
}
