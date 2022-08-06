# Contributor: Thomas Ward <github.com/teward>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='vmfs6-tools'
pkgver=0.2.0
pkgrel=1
pkgdesc="Tools to access VMFS6 filesystems"
arch=('x86_64')
url="https://github.com/teward/vmfs6-tools"
license=('GPL')
depends=('fuse2')
makedepends=('gcc'
             'make')
optdepends=('pkgconf'
            'asciidoc'
            'libxslt'
            'docbook-xsl'
            'util-linux-libs: for libuuid.so' )
provides=('vmfs6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('647485a97e6a1f0a8b8687e4df8eeb1d660d35e5faec9dfae695be087f96afbf')

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
