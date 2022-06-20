# Contrinutor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=djvusmooth
pkgver=0.3
pkgrel=3
pkgdesc='A graphical editor for DjVu documents'
arch=('any')
url='http://jwilk.net/software/djvusmooth'
license=('GPL2')
depends=('python2-djvulibre' 'python2-subprocess32' 'python2-pyxdg' 'wxpython')
source=(https://github.com/jwilk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('efb65f32eabd9c69c5a0a469d0547d04')

build() {
	cd $pkgname-$pkgver
	sed -i 's:/usr/bin/env python:&2:' $pkgname
	python2 setup.py build
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root="$pkgdir"
}
