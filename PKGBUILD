# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-cache-http'
pkgver='0.001000'
pkgrel='1'
pkgdesc="HTTP/1.1 cache validators for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-mro-compat')
makedepends=('perl-catalyst-runtime' 'perl-http-message' 'perl-test-use-ok' 'perl-test-www-mechanize-catalyst')
url='http://search.cpan.org/dist/Catalyst-Plugin-Cache-HTTP'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAF/Catalyst-Plugin-Cache-HTTP-0.001000.tar.gz')
md5sums=('d94127a5a3c8ac6dcb9efcc6fd7591a9')
sha512sums=('f8ef947921a736a43f2e18ea085f85ecc7acc20d4a7fb68987deb375355ca6a87ad79849d22fd216ad0193444c9b3a74367052290b8ffdcfcdf2e6450992e831')
_distdir="Catalyst-Plugin-Cache-HTTP-0.001000"

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
