# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-metacpan-client'
pkgver='1.013000'
pkgrel='1'
pkgdesc="A comprehensive, DWIM-featured client to the MetaCPAN API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-maybexs' 'perl-moo' 'perl-safe-isa' 'perl-search-elasticsearch>=1.10' 'perl-try-tiny' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-requires')
url='https://metacpan.org/release/MetaCPAN-Client'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MICKEY/MetaCPAN-Client-1.013000.tar.gz')
md5sums=('1925e7582467b7b8588ae3fcb26a9390')
sha512sums=('953291df85616baf60c4ec9f7b5d25aabe25f3b551f36bbb32fd50107b9ecd379b4a68c873e56b0897275aa535d6765c4937c909c36480c13040ceda1e807888')
_distdir="MetaCPAN-Client-1.013000"

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
