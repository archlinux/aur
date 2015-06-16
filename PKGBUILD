# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-template-alloy'
pkgver='1.020'
pkgrel='1'
pkgdesc="TT2/3, HT, HTE, Tmpl, and Velocity Engine"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Template-Alloy'
source=('http://search.mcpan.org/CPAN/authors/id/R/RH/RHANDOM/Template-Alloy-1.020.tar.gz')
md5sums=('b7106441b0f52759718edabb50a760b1')
sha512sums=('da848d64a05ef880b328efaf5f12aeeb1040150d2b0f90accbde7d5d78f9534a23a60767fd8d7f06b98bb664bb873e23289b23730736488e256d183e5e270e90')
_distdir="Template-Alloy-1.020"

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
