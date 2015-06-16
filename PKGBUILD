# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-moosex-traits-pluggable'
pkgver='0.12'
pkgrel='1'
pkgdesc="trait loading and resolution for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-list-moreutils' 'perl-moose' 'perl-namespace-autoclean')
makedepends=()
checkdepends=('perl-test-exception')
url='http://search.mcpan.org/dist/MooseX-Traits-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/MooseX-Traits-Pluggable-0.12.tar.gz')
md5sums=('b705fa4857c15d2f73fbdc0d46cb071c')
sha512sums=('0f47d3d8ce6a8d24f4fe9cc2f5c25f594801c95667271f11b8b596f0100189610d9047177dfc23a7786c9f650ffbce3330d38df582dfc0b396b39102a85de2d3')
_distdir="MooseX-Traits-Pluggable-0.12"

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
