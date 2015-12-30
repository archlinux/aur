# Maintainer: weltensturm <weltensturm at gmail dot com>

_name=flatman
pkgname=${_name}-git
pkgver=v1.0.2.r2.geea5cdb
pkgrel=1
pkgdesc="Tiling window manager written in D"
arch=('i686' 'x86_64')
url="https://github.com/weltensturm/flatman"
license=('MIT')

conflicts=('flatman')
depends=('libxft' 'libxrender')
makedepends=('dub' 'dmd')

source=("$pkgname"::'git+https://github.com/weltensturm/flatman')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./build.sh
}

package() {
	cd "$pkgname"
	./install.sh "$pkgdir"
}

