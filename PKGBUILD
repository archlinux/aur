# Contributor: Jan Tojnar <jtojnar@gmail.com>

pkgname=rrun
pkgver=0.2.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="minimalistic command launcher in rust similar to gmrun"
url='https://github.com/buster/rrun'
license=('GPL')
depends=('cairo' 'gcc-libs' 'gtk3')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buster/rrun/archive/v${pkgver}.tar.gz")
sha256sums=('cfb571d1242e6c20cb4babace6d73d9ecacb198665bf779bacf4c64f37d858f2')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install "target/release/rrun" "$pkgdir/usr/bin/rrun"
}
