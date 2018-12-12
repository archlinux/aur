# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

_distname=Eval-WithLexicals

pkgname='perl-eval-withlexicals'
pkgver='1.003006'
pkgrel='1'
pkgdesc="pure perl eval with persistent lexical variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0.009006' 'perl' 'perl-strictures')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/${_distname}-${pkgver}.tar.gz")
sha512sums=('3195f221b4c8c49e3a22e5fac4d318898c970406874d15dd2301375306bde4ebb070d64e3cb2f245eb84aac870eeacb37ed3826ca9b1b3e1cd83aebbb66dc13c')
_distdir="${_distname}-${pkgver}"

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
