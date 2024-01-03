# Maintainer: Marcin Stragowski <marcin.stragowski@gmail.com>
pkgname=bsum
pkgver=latest
pkgrel=1
pkgdesc="blocksum - Simple file or block device - per block SHA512 sum calculator"
arch=('x86_64')
url="https://github.com/noderblade/blocksum"
license=('MIT')
depends=('openssl')
makedepends=('git' 'make' 'gcc') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/noderblade/blocksum")


build() {
  cd "$srcdir/blocksum"
	make
}

package() {
  cd "$srcdir/blocksum"
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('SKIP') 
