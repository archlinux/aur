# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-mocktime'
pkgver='0.12'
pkgrel='1'
pkgdesc="Mock time/localtime for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-MockTime'
source=('http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/Test-MockTime-0.12.tar.gz')
md5sums=('de726192bcdd0cef68a07ffdf11d7300')
sha512sums=('f3f66fb7c0cd5a83218d92cd706c4f6eeaf7d93b89e3ba7dface799facf47070c727bf7da5805c9aba52fefb30b1290cc10957694386600ad7575f3cc33c86d3')
_distdir="Test-MockTime-0.12"

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
