# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Net-DNS-Paranoid'
pkgname=perl-net-dns-paranoid
pkgver=0.09
pkgrel=2
pkgdesc="paranoid dns resolver"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-accessor-lite' 'perl-net-dns')
makedepends=('perl-module-build-tiny')
options=('!emptydirs')
source=("http://cpan.perl.org/authors/id/T/TO/TOKUHIROM/$_perlmod-$pkgver.tar.gz")
sha256sums=('a2bbedc3e5a91fdce61f6721ee9591266e4ef95c557f0fcb64fd97e123ed5bdf')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

  ./Build install --installdirs=vendor --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
