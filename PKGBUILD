# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-scripter-plugin-ajax'
pkgver='0.09'
pkgrel='1'
pkgdesc="WWW::Scripter plugin that provides the XMLHttpRequest object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-html-dom' 'perl-je>=0.041' 'perl-uri' 'perl-www-scripter' 'perl-www-scripter-plugin-javascript>=0.002' 'perl-xml-dom-lite>=0.09' 'perl-constant-lexical')
makedepends=()
url='https://metacpan.org/release/WWW-Scripter-Plugin-Ajax'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/WWW-Scripter-Plugin-Ajax-0.09.tar.gz')
md5sums=('b5460a6e639d79218f610990ee114649')
sha512sums=('d16da9c72d4ac7e050baa19b8bed05bea4970efd078292ade85d2ec5f0ba813437cb518e784c489ad991f9468c61e779408e03488a8d4f469490f7f056696924')
_distdir="WWW-Scripter-Plugin-Ajax-0.09"

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
