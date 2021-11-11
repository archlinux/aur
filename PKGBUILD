# Contributor: Thomas Ward <github.com/teward>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='vmfs6-tools'
pkgver=0.1.0
pkgrel=2
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
sha256sums=('e132c41e7f18294cfd391d49ce94115d782650a387974a2049fc3b50dc3e575e')

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
