# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-validate-simple'
pkgver='0.3.0'
pkgrel='1'
pkgdesc="(Relatively) Simple way to validate input parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-types>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0')
url='https://metacpan.org/release/Validate-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDREIP/Validate-Simple-v0.3.0.tar.gz')
md5sums=('ef62bb901c08e6d02e2ba1a64c809053')
sha512sums=('e110b79c36af13b35ef38b7907c72bb4885663f896694d2d3bb9afff8b899560ac6b8b080ae6d9fcffaee21b9beb5edb22edab1da8c6ebb7e080f96a21d965a4')
_distdir="Validate-Simple-v0.3.0"

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
