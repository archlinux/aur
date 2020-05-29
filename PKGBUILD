# Maintainer: Linus Probert <linus.probert@gmail.com>
pkgname=blightmud
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A terminal mud client written in rust"
arch=('x86_64' 'i686')
url="https://github.com/liquidityc/blightmud"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('blightmud')
conflicts=('blightmud')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/LiquidityC/Blightmud/archive/release-$pkgver.tar.gz")
md5sums=('dea71c88fd89a299332ea672ec175bc5')

prepare() {
	mv Blightmud-release-$pkgver $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

package() {
	cd $pkgname-$pkgver
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/blightmud" "$pkgdir/usr/bin/blightmud"
}
