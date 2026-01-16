# Maintainer: René Wagner < rwagner@rw-net.de >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-feed'
pkgver='1.0.0'
pkgrel='1'
pkgdesc="Syndication feed parser and auto-discovery"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-datetime-format-iso8601' 'perl-class-errorhandler' 'perl-feed-find' 'perl-datetime-format-flexible' 'perl-datetime-format-natural' 'perl-datetime-format-mail' 'perl-datetime-format-w3cdtf' 'perl-html-parser' 'perl-libwww' 'perl-uri-fetch' 'perl-xml-atom>=0.38' 'perl-xml-libxml>=1.66' 'perl-xml-rss>=1.47')
makedepends=('perl-test-hasversion' 'perl-test-pod-coverage' 'perl-test-pod')
url='http://search.cpan.org/dist/XML-Feed'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/XML-Feed-v${pkgver}.tar.gz")
_distdir="XML-Feed-v${pkgver}"

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
sha256sums=('80d093ffbcaaeaa71f437758d010d7e748ec76d1f3e30e742354572cb725b1cc')
