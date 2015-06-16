# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-parse-method-signatures'
pkgver='1.003016'
pkgrel='1'
pkgdesc="Perl6 like method signature parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.19' 'perl-list-moreutils>=0.20' 'perl-moose' 'perl-moosex-traits>=0.06' 'perl-moosex-types>=0.17' 'perl-moosex-types-structured' 'perl-ppi>=1.203' 'perl-namespace-clean>=0.10')
makedepends=('perl-aliased')
checkdepends=('perl-test-differences' 'perl-test-exception')
url='http://search.mcpan.org/dist/Parse-Method-Signatures'
source=('http://search.mcpan.org/CPAN/authors/id/I/IL/ILMARI/Parse-Method-Signatures-1.003016.tar.gz')
md5sums=('903ec11316e55aee531fc2475ce76bac')
sha512sums=('ff0b2bcf91ba28a8646f4958e0aa2f77c88f7bf754c0971f5aa8e2056ba714049cdf0ffdb9eafceacee78f07564037920c5718174c5b505b1a4e0cd53739fa52')
_distdir="Parse-Method-Signatures-1.003016"

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
