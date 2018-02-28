# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-affixes'
pkgver='0.09'
pkgrel='1'
pkgdesc="Prefixes and suffixes analysis of text"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008_001')
makedepends=()
url='https://metacpan.org/release/Text-Affixes'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAPPA/Text-Affixes-0.09.tar.gz')
md5sums=('0f05cfaaf2b525d611cb4c06275fdec6')
sha512sums=('636c3a733da49d8ebdcb0d685eb535351b8d234df8e593233904e4de7e60d9bed6050babc44755e12efcbfabd1755b314503c3979df0d9591f9c8ef472c2e5d7')
_distdir="Text-Affixes-0.09"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
