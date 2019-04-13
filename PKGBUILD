# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-lwp-useragent'
pkgver='0.033'
pkgrel='1'
pkgdesc="A LWP::UserAgent suitable for simulating and testing network calls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-date' 'perl-http-message' 'perl-path-tiny' 'perl-safe-isa' 'perl-test-deep>=0.110' 'perl-test-fatal' 'perl-test-requires' 'perl-test-requiresinternet' 'perl-test-warnings>=0.009' 'perl-try-tiny' 'perl-uri>=1.62' 'perl-libwww' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-LWP-UserAgent'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-LWP-UserAgent-0.033.tar.gz')
md5sums=('0ec577e7c12c5a1c56ad97822e0f46a6')
sha512sums=('d04dd50a5039149c81a80aabda741c9373601e1d84a878e9a48a77b476d3e2f69a604ad02776297bf99b1ce0bbb9d5a22b276389912fd3fc83964e3931217312')
_distdir="Test-LWP-UserAgent-0.033"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
