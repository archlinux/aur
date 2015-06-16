# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpan-distnameinfo'
pkgver='0.12'
pkgrel='1'
pkgdesc="Extract distribution name and version from a distribution filename"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/CPAN-DistnameInfo'
source=('http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/CPAN-DistnameInfo-0.12.tar.gz')
md5sums=('06bc803c0e4fb7735ddc7282163f1cc3')
sha512sums=('f52eb88b87ab732d13c2ee4e4770cf27c249d2b2446b51e75abe31f2a70b8dc7d8370f4c4426fa68cc8fa7a905668dfdcd1387cd98e239393bde90d1965929f1')
_distdir="CPAN-DistnameInfo-0.12"

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
