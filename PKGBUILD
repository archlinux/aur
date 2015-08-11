# Maintainer: Garrett <floft.net/contact>
pkgname=gimp-plugin-insanebump
pkgver=3
pkgrel=1
pkgdesc="A GIMP plugin for bump maps"
arch=('any')
url='http://registry.gimp.org/node/28117'
license=('GPLv3')
depends=('gimp' 'python2')
source=('http://registry.gimp.org/files/InsaneBump.py_3.txt')
md5sums=('48a85ef45387b621303ac72fb67be3fe')

build() {
    sed -i "s/env python/&2/" "$srcdir/InsaneBump"*
}

package() {
    dir="$pkgdir/usr/lib/gimp/2.0/plug-ins/"
	mkdir -p "$dir"
	cp "$srcdir/InsaneBump"* "$dir/InsaneBump.py"
    chmod +x "$dir/InsaneBump.py"
}
