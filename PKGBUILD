# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-plugin-type'
pkgver='0.02'
pkgrel='1'
pkgdesc="Determine type information for columns"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi' 'perl-dbi>=0.94')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Plugin-Type'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/Class-DBI-Plugin-Type-0.02.tar.gz')
md5sums=('2f80426ccc67629543404ee9376a6d3e')
sha512sums=('b48102e896fc4cb1e492538ea5fb1a0eab7ab1486cb2cbe39a49dad14ec0f4a76b31d32bac1eae2cb6749a4d5b6758a3725f9527e6c4af3410ba6283973a95a5')
_distdir="Class-DBI-Plugin-Type-0.02"

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
