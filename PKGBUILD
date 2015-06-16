# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-package-variant'
pkgver='1.002002'
pkgrel='1'
pkgdesc="Parameterizable packages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-import-into' 'perl-module-runtime>=0.013' 'perl' 'perl-strictures')
makedepends=()
checkdepends=('perl-test-fatal')
url='http://search.mcpan.org/dist/Package-Variant'
source=('http://search.mcpan.org/CPAN/authors/id/H/HA/HAARG/Package-Variant-1.002002.tar.gz')
md5sums=('dd86d48c51beca32d36799f1bf540faf')
sha512sums=('526c7917a4bac8d33577c07f9315a91142f38bd0965d789011a148f644b8c62806ccac5488da2af13f3dddd3af46e7c3ab3ff635f0d16abd9b3a546202a8d62f')
_distdir="Package-Variant-1.002002"

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
