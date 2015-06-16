# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-sub-identify'
pkgver='0.10'
pkgrel='1'
pkgdesc="Retrieve names of code references"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Sub-Identify'
source=('http://search.mcpan.org/CPAN/authors/id/R/RG/RGARCIA/Sub-Identify-0.10.tar.gz')
md5sums=('08bb2f22c85007d2cbb0eb9541c77355')
sha512sums=('e6450e42a5bd8c2da42503bf6b54078b478056cd8d3c5c1c750ea09c7a5835aa7ec9df45fa5b00c6f9d86390f2a32b2f31ce582d2af4bfd9bcbe215a88831e99')
_distdir="Sub-Identify-0.10"

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
