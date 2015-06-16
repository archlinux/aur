# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-http-browserdetect'
pkgver='1.70'
pkgrel='1'
pkgdesc="Determine Web browser, version, and platform from an HTTP user agent string"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-slurp')
makedepends=()
checkdepends=('perl-test-failwarnings' 'perl-test-most' 'perl-test-nowarnings')
url='http://search.mcpan.org/dist/HTTP-BrowserDetect'
source=('http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-BrowserDetect-1.70.tar.gz')
md5sums=('2265d35090604ffd2eff5e3c7c3aca0c')
sha512sums=('f814e1daec39e8bebce567ab8c50943b61781eda7b2d6a391b9267b5bdc0a2c68906531e915a5eead497ba1e7e37b39db1f5865dd3d0ff7794a3013db0e1fa44')
_distdir="HTTP-BrowserDetect-1.70"

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
