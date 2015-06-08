# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-epoch'
pkgver='0.13'
pkgrel='1'
pkgdesc="Convert dates to seconds since epoch, for arbritrary epochs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.31' 'perl-params-validate')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-Epoch'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/DateTime-Format-Epoch-0.13.tar.gz')
md5sums=('f42982ea634401df953f88ce5eec1b7d')
sha512sums=('f750126b7609c00e746b5a2c9c0aa5db0e906fbeacfadb065eb5746873ec2bc33bdb209f2359bd1b0e18406053c4e6c87b54623a2d74c1053767643a2da17a1a')
_distdir="DateTime-Format-Epoch-0.13"

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
