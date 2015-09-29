# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-sharedfork'
pkgver='0.34'
pkgrel='1'
pkgdesc="fork test"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-requires' 'perl')
makedepends=()
url='https://metacpan.org/release/Test-SharedFork'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-SharedFork-0.34.tar.gz')
md5sums=('40b7dd32228f7e6c2e31c41fb863df16')
sha512sums=('b88b5e5129e74e20886707408ecf913a8871c30f132d1430a356f747cee8895fac3cdec708ef954326d3f5cde8742f652fd4cd3863cc074480dfc2c9488f4b0a')
_distdir="Test-SharedFork-0.34"

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
