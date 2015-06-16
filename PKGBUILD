# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lyrics-fetcher'
pkgver='0.5.2'
pkgrel='1'
pkgdesc="Perl extension to manage fetchers of song lyrics."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lyrics-Fetcher'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BIGPRESH/Lyrics-Fetcher-0.5.2.tar.gz')
md5sums=('ab370936d25331b337677aa0b7ad48d0')
sha512sums=('cf333e00b602ee388970f121383c2bf229ab81a52c3dea805c7213af5201e4729e84da019892d3352733ec10570c9b62a2b2eef9e3b046236eed0f03de9bc9b6')
_distdir="Lyrics-Fetcher-0.5.2"

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
