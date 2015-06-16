# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-carp-always'
pkgver='0.13'
pkgrel='1'
pkgdesc="Warns and dies noisily with stack backtraces"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-base>=0')
url='http://search.cpan.org/dist/Carp-Always'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Carp-Always-0.13.tar.gz')
md5sums=('fe99c5255bcb3de5cd1fbb1e671d63b0')
sha512sums=('0ef666c45ed85f4dad5f955d13116a4c3cccb3395db80547629bf0d87f9494653fe5a85405252b650d4d92a4008c0d541a995ccae1139c7374b057317324d361')
_distdir="Carp-Always-0.13"

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
