# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-form-urlencoded'
pkgver='0.25'
pkgrel='1'
pkgdesc="parser and builder for application/x-www-form-urlencoded"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/WWW-Form-UrlEncoded'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/WWW-Form-UrlEncoded-0.25.tar.gz')
md5sums=('c7f8fbd616f9a342b5ff726b405d2a96')
sha512sums=('3d962434e6a104110412956a1523e1ca30462855665ebbfccbcd136f80aa788e835adf1472b5f94c1e6f177758c10bb4b06ea693ffd8ff5f262e731930e5a727')
_distdir="WWW-Form-UrlEncoded-0.25"

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
