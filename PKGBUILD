# Contributor: András Wacha <awacha@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-utils'
pkgver='1.14'
pkgrel='3'
pkgdesc="Useful mathematical functions not in Perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/Math-Utils'
source=("http://search.cpan.org/CPAN/authors/id/J/JG/JGAMBLE/Math-Utils-${pkgver}.tar.gz")
md5sums=('be0504c2d0e6c08bf59c9b7754eddb70')
sha512sums=('b9e011a4b17eaa452de4ab978c87c593bf0195124fbc2d30a322bc4a571960686cc1b4b6a98ec5c90739569b77324bf0a239dafe52bdea28e0b0c7af18aca753')
_distdir="Math-Utils-${pkgver}"

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
