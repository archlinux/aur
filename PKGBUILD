# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-scraper'
pkgver='0.38'
pkgrel='3'
pkgdesc="Web Scraping Toolkit using HTML and CSS Selectors or XPath expressions"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-only')
options=('!emptydirs')
depends=('perl-html-parser>=0' 'perl-html-selector-xpath>=0.03' 'perl-html-tagset>=0' 'perl-html-tree>=0' 'perl-html-treebuilder-xpath>=0.08' 'perl-universal-require>=0' 'perl-uri>=0' 'perl-xml-xpathengine>=0.08' 'perl-yaml>=0' 'perl-libwww>=0' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-base>=0' 'perl-test-requires>=0')
url='https://metacpan.org/release/Web-Scraper'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Web-Scraper-0.38.tar.gz')
sha512sums=('bce42ad903c473290d68a3b9a3a978f47d8d6388b63f6a7e91feb72d9213eb9a79948c70ad99b846eaa0c5fd43e390261e7779df64c768e32326de0a09e00b20')
_distdir="Web-Scraper-0.38"

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
