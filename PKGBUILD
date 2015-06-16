# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-term-encoding'
pkgver='0.02'
pkgrel='1'
pkgdesc="Detect encoding of the current terminal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Term-Encoding'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Term-Encoding-0.02.tar.gz')
md5sums=('67b7fb38ec7779a3fb79a047fd7edbb5')
sha512sums=('cd4cee9991d857c40b8e8747a645429dcb1f416552d9bb6bd59da609bc4eb11c295a9b4d4c9b1a6e738af57fbc7179419d07387f3342658bf7ec6da90256efad')
_distdir="Term-Encoding-0.02"

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
