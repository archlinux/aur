# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-weaken'
pkgver='3.022000'
pkgrel='1'
pkgdesc="Test that freed memory objects were, indeed, freed"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Test-Weaken'
source=('http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Test-Weaken-3.022000.tar.gz')
md5sums=('67aa37a1de788bf40abf7dd07c787f6a')
sha512sums=('07ed16a29c3de052cb0f5884fc06715e10e6214e46b4ed7f7d8524931da293a903ae283e2935c109ea1be9336aeb5d092403249d60730624c590e9e54b38ff1b')
_distdir="Test-Weaken-3.022000"

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
