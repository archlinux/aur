# Maintainer: GDucpm <ducpm2306@gmail.com>
# erm good package :))))

pkgname=wordrnd #name
pkgver=1.0.0 #version
pkgrel=2 #pkgbuild version
pkgdesc="An utterly useless package that just generates random UNIX sentences and Clippy with no rules made out of pure boredom and curiosity" #because why not
arch=('x86_64') #architecture
keywords=('random' 'clippy' 'joke' 'gducpm' 'word' 'generator' 'gen')
url="https://github.com/gducpm/wordrnd" #repo link
license=('GPL3') #license
depends=('glibc') #run dependencies
makedepends=('gcc' 'make') #build dependencies
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz") #downloaded tarball name + tarball dest
sha256sums=("7617d0cee8d4d3b04f3f7afc90abda3df93f60af279d6eaf3894391176e172dd") #sha256 checksum

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/wordrnd "$pkgdir/usr/bin/wordrnd"
}
