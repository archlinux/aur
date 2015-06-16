# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-feed'
pkgver='0.52'
pkgrel='1'
pkgdesc="Syndication feed parser and auto-discovery"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler' 'perl-datetime' 'perl-datetime-format-mail' 'perl-datetime-format-w3cdtf' 'perl-feed-find' 'perl-html-parser' 'perl-libwww' 'perl-uri-fetch' 'perl-xml-atom>=0.38' 'perl-xml-libxml>=1.66' 'perl-xml-rss>=1.47')
makedepends=()
url='http://search.cpan.org/dist/XML-Feed'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/XML-Feed-0.52.tar.gz')
md5sums=('9ab88ee2e65bfaa10da4edd626c7e8cb')
sha512sums=('47416579ddef2d1f21a16662bed1a11a80fce865cc680df78e65b8d0ded66e45f05edbe44ca8bfe6d94c4f5590eda7358c36082be3d8e116f888bb563240dabe')
_distdir="XML-Feed-0.52"

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
