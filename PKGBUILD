# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xhtml-mediawiki'
pkgver='0.11'
pkgrel='1'
pkgdesc="Convert MediaWiki text to xhtml"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-params-validate>=0.85' 'perl-uri')
makedepends=('perl-test-xml')
url='http://search.cpan.org/dist/XHTML-MediaWiki'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAM/XHTML-MediaWiki-0.11.tar.gz')
md5sums=('28d61f37a3b1b996e69bb5fb389ccfcd')
sha512sums=('c2a7fb2d5ca66643f9add7ae85dff68086c3b7375408bf76f7e891577be7dd31bf7b782169f86ddb776517582d6c3ce409ece94a370bc63adb4f41999db504d6')
_distdir="XHTML-MediaWiki-0.11"

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
