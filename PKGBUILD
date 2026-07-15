# Maintainer: Murat <murat@muwat.org>

pkgname=fetchit
pkgver=2.0
pkgrel=1
pkgdesc="simple neofetch clone written in c++"
arch=('x86_64')
url="https://github.com/muwat0/fetchit"
license=('GPL-3.0-or-later')
depends=('libstdc++' 'libgcc' 'glibc')
makedepends=('gcc' 'make')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14911fe3e7295e3da865d55562f32d379ecd8aab42077914873dba0417c1f7fb')

build() {
cd "$pkgname-$pkgver"
   make build
}

package() {
	cd "$pkgname-$pkgver"
	# make install
	install -Dm 0755 "build/fetchit" "$pkgdir/usr/bin/$pkgname"
}
