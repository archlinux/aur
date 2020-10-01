# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='HTTP-Tiny-Paranoid'
_modnamespace=HTTP
pkgname=perl-http-tiny-paranoid
pkgver=0.07
pkgrel=1
pkgdesc="A safer HTTP::Tiny"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-method-modifiers' 'perl-net-dns-paranoid')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('8b7f9389fb42d77f7b9e0a42f93da413e7b32d183db96bd35b3707840a29b094')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
