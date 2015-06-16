# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-camelcase'
pkgver='0.02'
pkgrel='1'
pkgdesc="camelcase, de-camelcase"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/String-CamelCase'
source=('http://search.mcpan.org/CPAN/authors/id/H/HI/HIO/String-CamelCase-0.02.tar.gz')
md5sums=('74885aa8756fda9ff039c350214a4c09')
sha512sums=('51532369a5c8a0d231298a51ecf7a60d303dd896d2bd065f6fa984bd0fcbdfdc8220b205cc808a7e6e78195ab18d410a6ddca8e0f23f1eb23aff75acef089afd')
_distdir="String-CamelCase-0.02"

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
