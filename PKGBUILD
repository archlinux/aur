# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=perl-crypt-blowfish_pp
_pkgname=Crypt-Blowfish_PP
pkgver=1.12
pkgrel=1
pkgdesc="Perl/CPAN module Crypt::Blowfish_PP, Object oriented pure perl blowfish implementation"
arch=("i686" "x86_64")
url="https://metacpan.org/pod/Crypt::Blowfish_PP"
license=('GPL')
source=("https://cpan.metacpan.org/authors/id/M/MA/MATTBM/$_pkgname-$pkgver.tar.gz")
sha256sums=('714f1a3e94f658029d108ca15ed20f0842e73559ae5fc1faee86d4f2195fcf8c')

build() {
  cd $_pkgname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd $_pkgname-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
  rm -rf $pkgdir/usr/lib
}
