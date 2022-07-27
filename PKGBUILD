# Maintainer: Lionel Hernou <lionel.hernou@gmail.com>
pkgname=netradiant-custom
pkgver=20220211
pkgrel=1
pkgdesc="Open-source, cross-platform level editor for id Tech based games."
url="https://github.com/Garux/netradiant-custom"
depends=('gtk2' 'gtkglext' 'libxml2' 'zlib' 'libpng')
makedepends=('wget' 'svn' 'gcc' 'make')
source=('https://github.com/Garux/netradiant-custom/archive/refs/tags/20220211.tar.gz')
sha256sums=('c1f26ba21d113bc59ba6f9232f1b984c6455133f4a7984d081e79057148fdba1')
license=('custom')
arch=('any')

#prepare () {

#  cd "$srcdir"
#  make
#  }
build () {
	cd "$srcdir/$pkgname-$pkgver"
	echo $PWD
	make
}

package () {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir/$pkgname-$pkgver/install/" "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/mbspc" "$pkgdir/usr/bin/mbspc"
	ln -s "/opt/$pkgname/q2map" "$pkgdir/usr/bin/q2map"
	ln -s "/opt/$pkgname/q3data" "$pkgdir/usr/bin/q3data"
	ln -s "/opt/$pkgname/q3map2" "$pkgdir/usr/bin/q3map2"
	ln -s "/opt/$pkgname/qdata3" "$pkgdir/usr/bin/qdata3"
	ln -s "/opt/$pkgname/radiant" "$pkgdir/usr/bin/radiant"
}
