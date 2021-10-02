# Maintainer: René Wagner < rwagner@rw-net.de >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-feed'
pkgver='0.63'
pkgrel='1'
pkgdesc="Syndication feed parser and auto-discovery"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler' 'perl-feed-find' 'perl-datetime-format-flexible' 'perl-datetime-format-natural' 'perl-datetime-format-mail' 'perl-datetime-format-w3cdtf' 'perl-html-parser' 'perl-libwww' 'perl-uri-fetch' 'perl-xml-atom>=0.38' 'perl-xml-libxml>=1.66' 'perl-xml-rss>=1.47')
makedepends=()
url='http://search.cpan.org/dist/XML-Feed'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/XML-Feed-${pkgver}.tar.gz")
sha256sums=('9c8a996c82c2915b2fce820ef49f79184a7fef5e3aaadc688a00fb3a23c4d911')
_distdir="XML-Feed-${pkgver}"

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
