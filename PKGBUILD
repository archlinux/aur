# Maintainer: beest <gnubeest@gmail.com>

pkgname=romextract
pkgver=0.1
pkgrel=1
pkgdesc="various Linux tools for extracting ROMs from Wii Virtual Console WADs"
arch=('i686' 'x86_64')
url="https://github.com/Plombo/romextract"
license=('unknown')
optdepends=('python2: for nes_rom_extract') 
makedepends=('git')
conflicts=('romextract-git')
source=("https://github.com/gnubeest/romextract/archive/v$pkgver.tar.gz")
md5sums=('7bdae7b0e1d720c0af118e0f7c69c4b7')

build() {
	cd "$pkgname-$pkgver"
	./build.sh
}
package() {
	cd "$pkgname-$pkgver/bin"
	install -Dm755 ccfextract nes_rom_extract romc u8it wadunpacker -t "$pkgdir/usr/bin"
}
