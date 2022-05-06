# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-lwp-useragent'
pkgver='0.036'
pkgrel='1'
pkgdesc="A LWP::UserAgent suitable for simulating and testing network calls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

depends=(
  'perl-http-date'
  'perl-http-message'
  'perl-libwww'
  'perl-namespace-clean>=0.19'
  'perl-path-tiny'
  'perl-safe-isa'
  'perl-try-tiny'
  'perl-uri>=1.62'
  'perl>=5.006'
)
makedepends=()

checkdepends=(
  'perl-test-deep>=0.110'
  'perl-test-fatal'
  'perl-test-needs'
  'perl-test-requires'
  'perl-test-requiresinternet'
  'perl-test-warnings>=0.009'
)
url='https://metacpan.org/release/Test-LWP-UserAgent'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-LWP-UserAgent-$pkgver.tar.gz")
md5sums=('92c88afe67f9d2caf8b1cd75beae7457')
sha512sums=('6cf34dbd9c6fee3ab25ee31a97694f24499c7f41cd3d08e915176235148e69729f9434d58da78645e306d966031d2807f333f9847ddcc53b33474e6e6bea9e8e')
_distdir="Test-LWP-UserAgent-$pkgver"

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
