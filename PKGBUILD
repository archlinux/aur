# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-exporter-easy'
pkgver='0.16'
pkgrel='1'
pkgdesc="Takes the drudgery out of Exporting symbols"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Exporter-Easy'
source=('http://search.cpan.org/CPAN/authors/id/F/FD/FDALY/Exporter-Easy-0.16.tar.gz')
md5sums=('16f44909db2e85578ed2f26db490312b')
sha512sums=('039c119344a92e2d2e549d0f9910d17d3d05eaeeb3b292de398893b1e2ca134122e75be7cdc820b3c8a4ebb7e9f657f0657a2376dc13eb36a40c4296a4fda93a')
_distdir="Exporter-Easy-0.16"

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
