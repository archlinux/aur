# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter-wikkawiki'
pkgver='0.50'
pkgrel='1'
pkgdesc="Convert HTML to WikkaWiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.5' 'perl-uri>=1.35')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter-WikkaWiki'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-WikkaWiki-0.50.tar.gz')
md5sums=('274b4dc8aca0b1f0b49e554121dfd680')
sha512sums=('7ea753ace221488f92840d7b4c93d53a6a3bffd376bad6f0492f121046038b2442fb7729aa6133ca23a21e095edf397b6bf0e43fe487f56345f9df101caa2911')
_distdir="HTML-WikiConverter-WikkaWiki-0.50"

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
