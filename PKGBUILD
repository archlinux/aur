# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-lazierattributes'
pkgver='1.07009'
pkgrel='1'
pkgdesc="Lazier Attributes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.39' 'perl-moox-returnmodifiers>=0.03' 'perl-namespace-clean>=0.27' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires>=0' 'perl-moose')
url='https://metacpan.org/release/MooX-LazierAttributes'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-LazierAttributes-$pkgver.tar.gz")
md5sums=('5c38ff736c94bdc6019ecb374ca6774d')
sha512sums=('0e0398f61d8e38ad7bf1567a88f162c5f4391846a7d97b133accc4d4c0776ec3fbbfeb85c16a6f56ff320fc701faa3a10cbdf0faf095007a90c98d93c06cac21')
_distdir="MooX-LazierAttributes-$pkgver"

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
