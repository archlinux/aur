# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-coerce-types-standard'
pkgver='0.000008'
pkgrel='1'
pkgdesc="Coercing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=2.003002' 'perl-moox-lazierattributes>=1.03' 'perl-type-tiny>=1.002001' 'perl>=5.006')
makedepends=()
checkdepends=('perl-json')
url='https://metacpan.org/release/Coerce-Types-Standard'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Coerce-Types-Standard-$pkgver.tar.gz")
md5sums=('c61d248a4df2d0835953dbb5ea06d8aa')
sha512sums=('3da1e4f30ab1941ead8359ddf512ba9639f724b40596b58860f3039a3ffe12595011d6e12e9de6ec38df4fc9b0d461c032b9b469cbec43e0a71517737fa967af')
_distdir="Coerce-Types-Standard-$pkgver"

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
