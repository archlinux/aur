# Maintainer: basicallygit <91993321+basicallygit@users.noreply.github.com>
# Issues with this package may be submitted to https://github.com/basicallygit/nacrypt/issues
pkgname=nacrypt
pkgver=1.2.6
pkgrel=1
pkgdesc="A simple & secure file encryption utility"
url="https://github.com/basicallygit/nacrypt"
arch=('x86_64')
license=('Apache-2.0')
depends=('libsodium' 'libseccomp' 'libcap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/basicallygit/nacrypt/archive/$pkgver.tar.gz")
sha256sums=("191acb9cafb94017ebff60a8cc7f4bb3772416091db0fcf65dce7d4c5220242c")
b2sums=("bda8a1eaf54f542d670cb1e6d20286d170bde504f3f2836417ac1856a602f5d7ff9c997fdd6cc09427378f9276000cd19cd66d31e0a7742e63295e0b0b6d7a78")

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	export CC=gcc
	export CXX=g++
	
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 nacrypt "$pkgdir/usr/bin/nacrypt"
}
