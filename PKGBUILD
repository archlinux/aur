# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mixin-linewise'
pkgver='0.108'
pkgrel='1'
pkgdesc="write your linewise code for handles; this does the rest"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-perlio-utf8-strict' 'perl-sub-exporter' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mixin-Linewise'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mixin-Linewise-0.108.tar.gz')
md5sums=('c0f62761c6ce2ae6dc3e54153d042009')
sha512sums=('2789126737e2798a94ab6d90614503717dbc6c4178d19a9dd1e32689869e8e1298ec168fd6ab53580e65b5ad7ff94e065dca4afb7b71c2bb453810da61d29450')
_distdir="Mixin-Linewise-0.108"

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
