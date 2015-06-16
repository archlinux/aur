pkgname=perl-io-socket-multicast
pkgver=1.12
pkgrel=2
pkgdesc="IO::Socket::Multicast - Object interface to socket communications for perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="http://search.cpan.org/dist/IO-Socket-Multicast/"
source=("http://search.cpan.org/CPAN/authors/id/B/BR/BRAMBLE/IO-Socket-Multicast-$pkgver.tar.gz")
md5sums=('c96e6cbb367b1d11ffe7bb9fbd833540')

build() {
    cd "$srcdir/IO-Socket-Multicast-$pkgver"
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$srcdir/IO-Socket-Multicast-$pkgver"
    make DESTDIR=$pkgdir install
}
