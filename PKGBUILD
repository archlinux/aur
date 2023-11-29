# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-datetimex-iso8601-interval
pkgver=0.004
pkgrel=1
pkgdesc='Provides a means of parsing and manipulating ISO-8601 intervals and durations. (via MetaCPAN distribution)'
_dist=DateTimeX-ISO8601-Interval
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-datetime' 'perl-datetime-format-iso8601' 'perl-params-validate')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/B/BP/BPHILLIPS/$_dist-$pkgver.tar.gz")
sha256sums=(5776b7e38bdc6d695ccfa2796ed212a0a1963b3c858894eb9e378a061adb9a73)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

