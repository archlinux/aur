# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-metacpan-client'
pkgver='1.014000'
pkgrel='1'
pkgdesc="A comprehensive, DWIM-featured client to the MetaCPAN API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-maybexs' 'perl-moo' 'perl-safe-isa' 'perl-search-elasticsearch>=2.02' 'perl-try-tiny' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-requires')
url='https://metacpan.org/release/MetaCPAN-Client'
source=('http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/MetaCPAN-Client-1.014000.tar.gz')
md5sums=('e9d2103a681ecfb193ee1900d0f09277')
sha512sums=('89c50bcfd80750d3ff645a84809e2979635552a11423ab783f79ad17617d2dabf35450354689d4d02add4a255b1e18d8d1680f9bf4b8fc2b8731200347b49ca6')
_distdir="MetaCPAN-Client-1.014000"

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
