# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-string-truncate'
pkgver='1.100600'
pkgrel='1'
pkgdesc="a module for when strings are too long to be displayed in..."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.953' 'perl-sub-install>=0.03')
makedepends=()
url='http://search.cpan.org/dist/String-Truncate'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Truncate-1.100600.tar.gz')
md5sums=('6d0e57801c5b9a8326a7d486c055571a')
sha512sums=('661356695cb21084be0833dc88662bbc770af755c878fc68adac260a9f33ffb141d79a50cf41b4f208165fec544197534d9a72a07c993a6dc263a3c700d9a504')
_distdir="String-Truncate-1.100600"

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
