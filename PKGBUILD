# Maintainer: GDucpm <ducpm2306@gmail.com>
# erm good package :))))

pkgname=wordrnd #name
pkgver=1.0.1 #version
pkgrel=2 #pkgbuild version
pkgdesc="An utterly useless package that just generates random UNIX sentences and Clippy with no rules made out of pure boredom and curiosity. Please vote for my package because I don't know what I'm doing." #lol
arch=('x86_64') #architecture
keywords=('random' 'clippy' 'joke' 'gducpm' 'word' 'generator' 'gen')
url="https://github.com/gducpm/wordrnd" #repo link
license=('GPL3') #license
depends=('glibc') #run dependencies
makedepends=('gcc' 'make') #build dependencies
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz") #downloaded tarball name + tarball dest
sha256sums=("c0827706a8dbc35123232e5098abe8c878006fcaae58266af9f3dd06a8576ca2") #sha256 checksum

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/wordrnd "$pkgdir/usr/bin/wordrnd"
}
