# Maintainer: PhotonX <photon89 [at] gmail [dot] com>

pkgname=perl-glib-io
pkgver=0.001
pkgrel=1
pkgdesc="Perl bindings to the GIO library"
arch=('i686' 'x86_64')
url="https://metacpan.org/pod/Glib::IO"
license=('LGPL')
depends=('perl' 'perl-glib-object-introspection')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/X/XA/XAOC/Glib-IO-$pkgver.tar.gz")
md5sums=('8628744ae27b20a2f45dbe2d620cb89c')

build() {
  cd "$srcdir/Glib-IO-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  PERL_USE_UNSAFE_INC=1 make
}

check() {
  cd "$srcdir/Glib-IO-$pkgver"
  make test
}

package() {
  cd "$srcdir/Glib-IO-$pkgver"
  make install DESTDIR="$pkgdir"
# template start; name=perl-binary-module-dependency; version=1;
#if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
#	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
#	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
#	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
#fi
# template end;
}
