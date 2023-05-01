# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=docker-lvm-plugin
pkgver=1.0
pkgrel=1
pkgdesc='Docker volume driver for LVM volumes'
arch=('x86_64')
url='https://github.com/containers/docker-lvm-plugin'
license=('GPL3')
makedepends=('go' 'go-md2man')
source=("https://github.com/containers/docker-lvm-plugin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a226fe30d4bc6a8cbb89b472ea53b290f62e49486f138abf155288cb2863ed67')

build() {
	cd "$pkgname-$pkgver"
	export GO111MODULE=on
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
