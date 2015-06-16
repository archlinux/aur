# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-class-errorhandler'
pkgver='0.03'
pkgrel='1'
pkgdesc="Base class for error handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008_001')
makedepends=()
url='http://search.mcpan.org/dist/Class-ErrorHandler'
source=('http://search.mcpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Class-ErrorHandler-0.03.tar.gz')
md5sums=('1335940a9467e98abfedd85bc09938d1')
sha512sums=('aefc6497b8ebdd3efe1643a84051b2739879f5472753a484b8eb14a29ba1826806bdc17ddb46efb50e969ceedae309fe7cfa965d9c45054b40fe2fbaed7b60a7')
_distdir="Class-ErrorHandler-0.03"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
