# Contributor: Thomas Ward <github.com/teward>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='vmfs6-tools'
pkgver=0.2.1
pkgrel=1
pkgdesc="Tools to access VMFS6 filesystems"
arch=('x86_64')
url="https://github.com/teward/vmfs6-tools"
license=('GPL')
depends=('fuse2')
makedepends=('gcc'
             'make'
             'asciidoc')
optdepends=('pkgconf'
            'util-linux-libs: for libuuid.so' )
provides=('vmfs6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef69aa9f74be992fedfb13c4a831945b0567d5c2bff50cdd4f0a987778addafc')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
