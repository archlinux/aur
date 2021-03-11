# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-validate-domain'
pkgver='0.14'
pkgrel='1'
pkgdesc="Domain and host name validation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-domain-tld>=1.74')
makedepends=()
checkdepends=('perl-test2-suite>=0')
url='https://metacpan.org/release/Data-Validate-Domain'
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Data-Validate-Domain-$pkgver.tar.gz")
md5sums=('699d4bde18afa56554d2579c1137ca8d')
sha512sums=('07cc397559bc412c456e3dbe55d792c4a0e93b3bf297565e26cc9c55919b3f643e8aa2c33a2c418de9264c1305448ffc287776eecfe9d125b3dfe369c4a95ed4')
_distdir="Data-Validate-Domain-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
