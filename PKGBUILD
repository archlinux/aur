# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-unicode-map'
pkgver='0.112'
pkgrel='1'
pkgdesc="V0.112 - maps charsets from and to utf16 unicode "
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Unicode-Map'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWARTZ/Unicode-Map-0.112.tar.gz')
md5sums=('edaa8fc5ddf0e5d805e274283dd0625d')
sha512sums=('f66961ee84db7316289176cf43ddb8366ecfaf614130f8b1018931a92b96d16a97f231da6fdd1d8c1bd95ddd50f4b93d82ff87affbbd1162c894b1f302f27d4f')
_distdir="Unicode-Map-0.112"

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
