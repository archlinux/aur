# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lyrics-fetcher-lyricwiki'
pkgver='0.10'
pkgrel='1'
pkgdesc="Get song lyrics from www.LyricWiki.org"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/Lyrics-Fetcher-LyricWiki'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BIGPRESH/Lyrics-Fetcher-LyricWiki-0.10.tar.gz')
md5sums=('e9344c29b2021e564382b6e98536a02e')
sha512sums=('48ca235986bebea87c4df86ca16a7ecd2fda91faf1eef2ee42a64562e17990506eedcc8801e044f80a8c890c8ea54bbcc5828e24008ccccb9c522154685e16ab')
_distdir="Lyrics-Fetcher-LyricWiki-0.10"

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
