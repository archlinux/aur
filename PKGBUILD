# Maintainer: vvch
# CPAN Name  : XXX
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xxx'
pkgver='0.38'
pkgrel='1'
pkgdesc="See Your Data in the Nude"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml-pp>=0.018' 'perl>=5.8.1')
optdepends=(perl-data-dump perl-data-dump-color perl-yaml-xs perl-yaml perl-json-color)
makedepends=()
url='https://metacpan.org/release/XXX'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/XXX-0.38.tar.gz')
md5sums=('684d4dba7d12b4a303d207166231f0fb')
sha512sums=('bb157d2efed5a832633481c52de0486780bf4f16cfc39f76d983d4ee3dc6cb6a6e88b7d28357884bce39befc1b6571525ba68332b2e44b35565160cd911d09bc')
_distdir="XXX-0.38"

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
    export PERL_XXX_DUMPER=''  #  workaround for bug: test fails if set not to YAML
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
