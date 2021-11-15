# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=MBASUNOV
_perlmod=RRD-Editor
pkgname=perl-rrd-editor
pkgver=0.21
pkgrel=1
pkgdesc="Portable, standalone (no need for RRDs.pm) tool to create and edit RRD files"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('761f9268771c4684544a2065e63d2b124a87448ca932853b538bfccc6dea4c6b')

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
