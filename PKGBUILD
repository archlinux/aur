# Maintainer: raf <raf at raf dot org>
pkgname=libslack
pkgver=0.7.5
pkgrel=1
pkgdesc="A UNIX/C library of general utilities for programmers with Slack"
arch=("i686" "x86_64" "armv7h" "aarch64")
url=https://libslack.org
license=("GPL")
depends=("glibc")
makedepends=("perl" "make" "gcc")
source=("https://libslack.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=("10561805042cf6c28476af110b886c4b695b4f38a119390acbb63996170b1cac")

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --destdir="$pkgdir" --disable-mail-test
	make
}

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	make install
}

