# Maintainer: Jan Tojnar <jtojnar@gmail.com>
pkgname=rrun
pkgver=0.2.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64')
pkgdesc="minimalistic command launcher in rust similar to gmrun"
url='https://github.com/buster/rrun'
license=('GPL')
depends=('cairo' 'gcc-libs-multilib' 'gtk3')
source=("https://github.com/buster/rrun/archive/${pkgver}/${pkgname}.tar.gz")
sha256sums=('819e025f97d647f0ea93a459b37bcf7b26f776d345bf78c6973e9cccf42639da')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install "target/release/rrun" "$pkgdir/usr/bin/rrun"
}
