# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-form-urlencoded'
pkgver='0.24'
pkgrel='1'
pkgdesc="parser and builder for application/x-www-form-urlencoded"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/WWW-Form-UrlEncoded'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/WWW-Form-UrlEncoded-0.24.tar.gz')
md5sums=('f586b90fa142741728547dc2ea573f15')
sha512sums=('57dfcccd059534d3d0cb2b1d8ee826e4a31e77920a43b72c5939a866de9d4b526e2f59411507c3287f8c7ae283f7ebeed07cda543f0d36663e6b155952cec63e')
_distdir="WWW-Form-UrlEncoded-0.24"

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
