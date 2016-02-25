# Author: Alberto Corona <ac@albertocorona.com>

pkgname=yabs-git
pkgver=0.1.0.rs.36.g26a628c
pkgrel=1
pkgdesc="Yet another build system"
arch=("any")
url="https://github.com/0X1A/yabs"
license=('BSD')
makedepends=('git' 'cargo' 'rust')
provides=('yabs')
conflicts=('yabs')
source=('git+https://github.com/0X1A/yabs.git')
md5sums=('SKIP')
_gitname=yabs

pkgver() {
	cd $_gitname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd $_gitname
	cargo build --release -j2
}

package() {
	cd $_gitname
	install -d $pkgdir/usr/bin
	install -m755 $srcdir/yabs/target/release/yabs $pkgdir/usr/bin/yabs
}
