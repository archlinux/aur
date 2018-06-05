# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname=PPIx-QuoteLike
pkgname=perl-ppix-quotelike
pkgver=0.005
pkgrel=1
pkgdesc="Parse Perl string literals and string-literal-like things."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/PPIx-QuoteLike'
source=("https://cpan.metacpan.org/authors/id/W/WY/WYANT/$_distname-$pkgver.tar.gz")
sha512sums=('70cf66dfbe40d6587fe278010bddaa6d96f2d076aadd7854708c80e3dff68c37d35447bb0594e05e1237e3ac719522f89d3c5ff70336700ffd10aad94b404104')

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
