# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=morgenlichtctl
pkgver=1.0
pkgrel=1
pkgdesc='A simple client for morgenlichtd, written in C.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://bennett.piater.name/morgenlichtctl'
license=('GPL3')

depends=('argtable' 'pandoc')
group=('morgenlicht')

#changelog="CHANGELOG"
source=("https://github.com/clawoflight/morgenlichtctl/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('e5d38b5b9153a95a7dc9c8ccbcd005618cb9e9f7adf6eb4968e1369a7bc400ab6872f0288aed523db65ea619abb612dae9159134fc1885929d0526b636d08ceb'
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
