# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=morgenlichtctl
pkgver=0.6.1
pkgrel=1
pkgdesc='A simple client for morgenlichtd, written in C.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://bennett.piater.name/morgenlichtctl'
license=('GPL3')

depends=('argtable')
group=('morgenlicht')

#changelog="CHANGELOG"
source=("https://github.com/clawoflight/morgenlichtctl/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('ad5aaa518a365fb67ea51722c146248779ad506b60b857b91fc74607375df68324494195f64ac37d0d9d264ef5a03da64a61f1698b71de02aca4a33534c55159'
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
