# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=ictree
pkgver='1.0.1'
pkgrel=1
pkgdesc="Like tree but interactive"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/NikitaIvanovV/ictree"
license=('GPL3')
depends=('glibc')
optdepends=('xsel: for copying selected item into X clipboard' 'wl-clipboard: for copying selected item into Wayland clipboard')
source=("$url/releases/download/v$pkgver/ictree-v$pkgver.tar.gz")
sha256sums=('a34730ab9722ea5718282b20cbe0904048447ecc11716909e2e03bb2057683d0')

build() {
	cd "$pkgsrc"
	make
}

package() {
	cd "$pkgsrc"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
