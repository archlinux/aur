# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-probe-perl'
pkgver='0.03'
pkgrel='1'
pkgdesc="Information about the currently running perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Probe-Perl'
source=('http://search.mcpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Probe-Perl-0.03.tar.gz')
md5sums=('8876e1b99c531800a86b383702e0ab73')
sha512sums=('739bdb9d1a74eb77ab885a5aca861a1915cadbb1002bb4cb0d21fc6940ae6b3aa64ee52951ac8b2dca41c9e8fe188e17ae5f3c848c4a1caaf66fec5d25bef49c')
_distdir="Probe-Perl-0.03"

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
