#Maintainer: Ali Emre Senel <aliemre@senel.biz>
pkgname=hperf
pkgver=6.14.5
pkgrel=1
pkgdesc="GUI tool for visualizing and annotating Linux perf traces"
arch=('x86_64')
url="https://www.poirrier.ca/hperf/"
license=('AGPL-3.0-only')
depends=('perf' 'binutils')
makedepends=('gcc' 'make')
optdepends=('highlight: Syntax highlighting for source code')
provides=('hperf')
source=("https://www.poirrier.ca/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6e812aab6e1ef93aeafec8cd143fe31c181289978d39d39293754e6fd50b96a2')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
