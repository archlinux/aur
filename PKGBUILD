# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-gin'
pkgver='0.11'
pkgrel='1'
pkgdesc="Generalized Inverted Indexing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-stream-bulk' 'perl-mro-compat' 'perl-moose>=0.89' 'perl-moosex-types-set-object' 'perl-scope-guard' 'perl-set-object' 'perl-namespace-autoclean' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-tempdir-tiny')
url='https://metacpan.org/release/Search-GIN'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Search-GIN-0.11.tar.gz')
md5sums=('d0e6ea8d44f05fd33da6cfa8bfe0787e')
sha512sums=('1f333146aac0d65943a3cbe87c2c172b750be2a67e9384a209e930b403417c95962be9338381a1da42375a3f25c4c74564fad45ffcb80693bb0ed0242260f429')
_distdir="Search-GIN-0.11"

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
