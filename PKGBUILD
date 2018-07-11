# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname=PPIx-QuoteLike
pkgname=perl-ppix-quotelike
pkgver=0.006
pkgrel=1
pkgdesc="Parse Perl string literals and string-literal-like things."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/PPIx-QuoteLike'
source=("https://cpan.metacpan.org/authors/id/W/WY/WYANT/$_distname-$pkgver.tar.gz")
sha512sums=('6ec80ac4df9a80bfd9310b7a5a1fe514dcfaf340de9d88fcece5ecdda9e5a2183408bc4631f546a76f538c7dbb6c4d3827788671fc57cf73d956e18589d09f9f')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
