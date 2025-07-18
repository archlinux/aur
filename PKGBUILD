# Contributor: Thor77 <thor77 at thor77 dot org>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-audio-flac-header
pkgver=2.4
pkgrel=12
pkgdesc='Audio::FLAC::Header - Access to FLAC audio metadata'
_dist=Audio-FLAC-Header
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL-1.0-or-later Artistic-1.0-Perl)
depends=(perl)
makedepends=(perl-module-install)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/D/DA/DANIEL/$_dist-$pkgver.tar.gz")
sha512sums=('53728279b79d3c320c63b66dff1e3e4d8bb4fd4bde164ad775a52d8b54b3d77861daa2d4e93d8e2c2ff2f1708ece8c4d2256d96b810266760bb837e557e3b8a9')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
