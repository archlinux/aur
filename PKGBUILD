# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=didjvu
pkgver=0.8
pkgrel=1
pkgdesc='DjVu encoder with foreground/background separation'
arch=(any)
url='http://jwilk.net/software/didjvu'
license=(GPL2)
depends=('python2>=2.6'
         'gamera>=3.2.3'
         'python2-pillow'
         'djvulibre>=3.5.22'
         'minidjvu>=0.8'
         'python2-configargparse'
         'python2-pyxmpp'
         'python2-exiv2>=0.3')
source=("https://pypi.python.org/packages/source/d/didjvu/$pkgname-$pkgver.tar.gz"
        "https://pypi.python.org/packages/source/d/didjvu/$pkgname-$pkgver.tar.gz.asc")
md5sums=('4cc6bbd2c938fbc4b950f68d7c724763'
         'SKIP')
validpgpkeys=(CDB5A1243ACDB63009AD07212D4EB3A6015475F5)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/python2 ./setup.py build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/python2 ./setup.py check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/python2 ./setup.py install --root="$pkgdir" --prefix=/usr
}
