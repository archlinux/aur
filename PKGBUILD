# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=perl4-corelibs
pkgver=0.003
pkgrel=3
pkgdesc="Deprecated libraries slated for removal from perl5"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~zefram/Perl4-CoreLibs-${pkgver}"
license=('PerlArtistic')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-${pkgver}.tar.gz)

build() {
  cd "$srcdir"/Perl4-CoreLibs-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Perl4-CoreLibs-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/lib
}
md5sums=('f74747c234470a087871f564a5f5db15')
