# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=morgenlichtctl
pkgver=1.1
pkgrel=1
pkgdesc='A simple client for morgenlichtd, written in C.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://bennett.piater.name/morgenlichtctl'
license=('GPL3')

depends=('argtable' 'pandoc')
group=('morgenlicht')

#changelog="CHANGELOG"
source=("https://github.com/clawoflight/morgenlichtctl/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('d2c0bd1bc82158f435e80b32b0e7461fe6f8f56289babb8645a7166b65cc48b97857e0ab62fc81b55dd6e9fe37c810d7463b6e056a56916400a1fdeb5405ecdf'
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
