#Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='sflasher-git'
pkgdesc='Samsung Swift (PNX49xx) Flasher/Dumper utility.'
pkgver=r27.d47c196
pkgrel=1

arch=('x86_64')
url='https://github.com/bhmsgame06/sflasher'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=()
makedepends=('git' 'arm-none-eabi-gcc')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
