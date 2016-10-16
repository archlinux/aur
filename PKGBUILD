# Maintainer: Niklas Krafczyk <krafczyk dot n at gmail dot com>
pkgname=runlim
pkgver=1.10
pkgrel=1
epoch=
pkgdesc="A tool for sampling and limiting time and memory usage of a program"
arch=('x86_64' 'i686')
url="http://fmv.jku.at/runlim/"
license=('BSD')
depends=('glibc')
makedepends=('gcc' 'make')
options=()
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('5e0855a5d554c75ea4caafb08ffcfa17')

build() {
	cd "$pkgname-$pkgver"
	./configure.sh
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -D -m755 runlim "$pkgdir/usr/bin/runlim"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
