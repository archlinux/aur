# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=perl4-corelibs
pkgver=0.004
pkgrel=1
pkgdesc="Deprecated libraries slated for removal from perl5"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~zefram/Perl4-CoreLibs-${pkgver}"
license=('PerlArtistic')
depends=('perl')
makedepends=('perl-module-build')
source=(http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-${pkgver}.tar.gz)

build() {
  cd "$srcdir"/Perl4-CoreLibs-$pkgver
  perl Build.PL
  ./Build
}

package() {
  cd "$srcdir"/Perl4-CoreLibs-$pkgver
  ./Build destdir="$pkgdir" installdirs=vendor install
  rm -r "$pkgdir"/usr/lib
}
md5sums=('1595fb1cd62c70935081f6a115e8120a')
