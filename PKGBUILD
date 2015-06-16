# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-system-command'
pkgver='1.110'
pkgrel='1'
pkgdesc="Object for running system commands"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run')
makedepends=()
url='http://search.mcpan.org/dist/System-Command'
source=('http://search.mcpan.org/CPAN/authors/id/B/BO/BOOK/System-Command-1.110.tar.gz')
md5sums=('19166c2d22250544ea928481b726900c')
sha512sums=('7395af65b2f79c96503e7d88ec90c8c8a55c192b4aefa5fb888dfcf0b24a623e6a50c1cf8bd233af701de387dea74fc7b004cf86254bff8c020a558ed812cf41')
_distdir="System-Command-1.110"

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
