# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter-tikiwiki'
pkgver='0.50'
pkgrel='1'
pkgdesc="Convert HTML to TikiWiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.5')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter-TikiWiki'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-TikiWiki-0.50.tar.gz')
md5sums=('25fa2d275319aa0e00aff52ddc2f26ec')
sha512sums=('e84d0d7b101a34666a70dd9a59df516be818e7f96bdc4b4dc6e6f80bc42978015d8597b8cced7ffaa68692da77d8db6fc8d49774cc9a26fd351f3e9c9839f097')
_distdir="HTML-WikiConverter-TikiWiki-0.50"

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
