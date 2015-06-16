# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mixin-linewise'
pkgver='0.106'
pkgrel='1'
pkgdesc="write your linewise code for handles; this does the rest"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-perlio-utf8-strict' 'perl-sub-exporter')
makedepends=()
url='http://search.mcpan.org/dist/Mixin-Linewise'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mixin-Linewise-0.106.tar.gz')
md5sums=('d4699cde97d8286f44624c1d19663334')
sha512sums=('976b139528f728c36ed865fd31430084f24522fc3fada3c4be1beaced2f05ffce09a2e996a3f4e1aade91e3264df81d8de2eafe56ec806d5d3f22446ce6d45c8')
_distdir="Mixin-Linewise-0.106"

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
