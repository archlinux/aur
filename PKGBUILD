# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-lwp-useragent'
pkgver='0.030'
pkgrel='1'
pkgdesc="A LWP::UserAgent suitable for simulating and testing network calls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-date' 'perl-http-message' 'perl-path-tiny' 'perl-safe-isa' 'perl-test-deep>=0.110' 'perl-test-fatal' 'perl-test-requires' 'perl-test-requiresinternet' 'perl-test-warnings>=0.009' 'perl-try-tiny' 'perl-uri>=1.62' 'perl-libwww' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-LWP-UserAgent'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-LWP-UserAgent-0.030.tar.gz')
md5sums=('6df189e5826eac05c311d7abc8f13b19')
sha512sums=('8bd9c2cf5b408f7f28fa3c388a63617068b7e2d1c9f9da9f7f99ed0aab12e1156451f790d03c6a0c1c5e660c65b9b33eff14a2e9561b36bc1601dad1ae99ae39')
_distdir="Test-LWP-UserAgent-0.030"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
