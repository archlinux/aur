# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=morgenlichtctl
pkgver=1.2
pkgrel=1
pkgdesc='A simple client for morgenlichtd, written in C.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://bennett.piater.name/morgenlichtctl'
license=('GPL3')

depends=('argtable' 'pandoc')
group=('morgenlicht')

#changelog="CHANGELOG"
source=("https://github.com/clawoflight/morgenlichtctl/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('947d7782f73180bb6139e547c4b181c734f6d49e7b2757af1cc71bbb55421e786d8f2e69d2abb010ca519bcc91f5c03148f51f106718877bead7733e43242b68'
            'SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
