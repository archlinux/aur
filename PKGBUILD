# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=ictree
pkgver='0.2.2'
pkgrel=2
pkgdesc="Like tree but interactive"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/NikitaIvanovV/ictree"
license=('GPL3')
depends=('glibc')
optdepends=('xsel: for copying selected item into X clipboard')
source=("$url/releases/download/v$pkgver/ictree-v$pkgver.tar.gz")
sha256sums=('c4576814ee8293c8eb48103f561b54ecd7ab7771ebe2e695a41328867a4234dd')

build() {
	cd "$pkgsrc"
	make
}

package() {
	cd "$pkgsrc"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
