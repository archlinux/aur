# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-validate'
pkgver='0.08'
pkgrel='1'
pkgdesc="common data validation methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Data-Validate'
source=('http://search.cpan.org/CPAN/authors/id/S/SO/SONNEN/Data-Validate-0.08.tar.gz')
md5sums=('2ca2c8d5750b5a0725f6b483442e6bc7')
sha512sums=('869d41dcbb8e97726317076a44836113db1861d825a592e0a6afac0041e5407b9d89a0145caf1ab21404539244081e84de5be1b3043fc169ee07a7098a715031')
_distdir="Data-Validate-0.08"

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
