# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-browserdetect'
pkgver='2.05'
pkgrel='1'
pkgdesc="Determine Web browser, version, and platform from an HTTP user agent string"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl-path-tiny' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-failwarnings' 'perl-test-most' 'perl-test-nowarnings')
url='https://metacpan.org/release/HTTP-BrowserDetect'
source=('http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-BrowserDetect-2.05.tar.gz')
md5sums=('979e27db7b46919a3a909b2728e1d118')
sha512sums=('9b044a25d194b87aa7d45c55ac9f387475e3dcb83286771653f35b6420ef28655862ee151081ce3ffe567919ccb84f042e0b6057e34ab1b44dabbee30ce4c7fc')
_distdir="HTTP-BrowserDetect-2.05"

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
