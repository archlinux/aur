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
sha256sums=("4a838c33130e6a3a3c443f95c3b3971c229744417715d24bcb13f759148a06f3")
b2sums=("b369cf5f7c750ad52c79e3b9adf6b850fb81a67fa006a1f7c218664eedadb63b3afa86ff18a8fa73813fffb92ae1deb1bb8cec58294444e7c60fc849a145c1cc")

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
