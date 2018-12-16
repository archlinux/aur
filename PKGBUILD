# Maintainer: Garrett <floft.net/contact>
pkgname=gimp-plugin-layerfx
pkgver=20120412
pkgrel=1
pkgdesc="A GIMP plugin for layer effects (Layer->Layer Effects)"
arch=('any')
url='http://registry.gimp.org/node/186'
license=('GPLv3')
depends=('gimp' 'python2')
source=('https://raw.githubusercontent.com/pixlsus/registry.gimp.org_static/master/registry.gimp.org/files/layerfx.2.8.py.txt')
md5sums=('408c5191552a7639f64bd6bd25891f85')

build() {
    sed -i "s/env python/&2/" "$srcdir/layerfx"*
}

package() {
    dir="$pkgdir/usr/lib/gimp/2.0/plug-ins/"
	mkdir -p "$dir"
	cp "$srcdir/layerfx"* "$dir/layerfx.py"
    chmod +x "$dir/layerfx.py"
}
