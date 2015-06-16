# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-b-keywords'
pkgver='1.13'
pkgrel='1'
pkgdesc="Lists of reserved barewords and symbol names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/B-Keywords'
source=('http://search.mcpan.org/CPAN/authors/id/R/RU/RURBAN/B-Keywords-1.13.tar.gz')
md5sums=('fe57415a76a423645c31281fe508bf46')
sha512sums=('6176dbe7ff25a7d355a03d887b6ec52e49c6bce634c3aa8dd5a7126201ac11e9f8ee6c78f7cacc353a5a83dea688646d25d675570fdba80d160abb45248eb08b')
_distdir="B-Keywords-1.13"

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
