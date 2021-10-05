# Maintainer: Linus Probert <linus.probert@gmail.com>
pkgname=blightmud
pkgver=3.4.0
pkgrel=1
epoch=
pkgdesc="A terminal mud client written in rust"
arch=('x86_64' 'i686')
url="https://github.com/blightmud/blightmud"
license=('GPL')
groups=()
depends=('gcc-libs' 'openssl' 'alsa-lib')
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blightmud/Blightmud/archive/v$pkgver.tar.gz")
md5sums=('98136bef06c553b8201a6cbe1f7466cc')

prepare() {
	mv Blightmud-$pkgver $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --target-dir=target
}

package() {
	cd $pkgname-$pkgver
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/blightmud" "$pkgdir/usr/bin/blightmud"
}
