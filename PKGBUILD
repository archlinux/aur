# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-devel-overloadinfo'
pkgver='0.002'
pkgrel='1'
pkgdesc="introspect overloaded operators"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat>=0' 'perl-package-stash>=0.14' 'perl-sub-identify>=0')
makedepends=()
url='http://search.cpan.org/dist/Devel-OverloadInfo'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Devel-OverloadInfo-0.002.tar.gz')
md5sums=('bff186962739cd63d303061f2da038b1')
sha512sums=('fb293f0466b40135c92b8579631a3fe4a7d4cbf1c3720d14972a24f2144218a00594d5496c0231a77f8ab3a465194d3c6beea02785fbd2629ce0f193060914a9')
_distdir="Devel-OverloadInfo-0.002"

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
