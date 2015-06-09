# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Oliver Mader <dotb52@gmail.com>

pkgname=qinfo
pkgver=1.0
pkgrel=2
pkgdesc="A tiny but strong ascii art text viewer written in C using GTK+."
url="https://github.com/b52/qinfo"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('gtk2')
source=("qinfo.zip::https://github.com/b52/qinfo/archive/9960dd847c4a5b25c11ca788e6b48ecb1b54074d.zip")
md5sums=('ba4ecbc406c2a37f9ce45c4e49d40213')

prepare() {
	cd "$srcdir"
	mkdir -p "$pkgname"
	mv ./"$pkgname"-*/* ./"$pkgname"/
}

build() {
	cd "$srcdir/$pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
