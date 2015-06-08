# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.21

pkgname='perl-authority-shared'
pkgver='0.006'
pkgrel='1'
pkgdesc="a multi-AUTHORITY method for your classes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-object-authority' 'perl-object-role')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/authority-shared'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/authority-shared-0.006.tar.gz')
md5sums=('a2f58964898d7d4e73869b3b11cbc33e')
sha512sums=('485b7da2c8e1424aed041f830df20bcb768c49ee6cbe8c5dc626afa6741287dd1bbafcec4c69e346bbf6f9bc4a76e3218a10913887ecc7e23192c45c0c0ca679')
_distdir="${srcdir}/authority-shared-0.006"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
