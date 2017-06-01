# Maintainer: 

pkgname=perl-perl4-corelibs
pkgver=0.003
pkgrel=3
pkgdesc="Libraries historically supplied with Perl 4"
arch=('any')
url="https://metacpan.org/release/Perl4-CoreLibs"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-$pkgver.tar.gz")
sha1sums=('ad4c5a9fa8da4f461dc774e5c53136a55413ef2f')

build() {
  cd Perl4-CoreLibs-$pkgver
  perl Build.PL
  ./Build
}

check() {
  cd Perl4-CoreLibs-$pkgver
  ./Build test
}

package() {
  cd Perl4-CoreLibs-$pkgver
  ./Build install installdirs=vendor destdir="$pkgdir"
}
