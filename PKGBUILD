# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=DOUGLEITH
_perlmod=RRD-Editor
pkgname=perl-rrd-editor
pkgver=0.18
pkgrel=1
pkgdesc="Portable, standalone (no need for RRDs.pm) tool to create and edit RRD files"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('48c7cf8567f72316bde7df655d9fd473')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
