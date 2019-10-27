# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=didjvu
pkgver=0.8.2
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
         'libgexiv2>=0.10.3'
         'python2-gobject')
source=("https://github.com/jwilk/didjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/jwilk/didjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
md5sums=(12b0eb70f45dd60dec09485480ffe304
         SKIP)
validpgpkeys=(CDB5A1243ACDB63009AD07212D4EB3A6015475F5)

build() {
        cd "$srcdir/$pkgname-$pkgver"
        /usr/bin/python2 setup.py build
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
        /usr/bin/python2 setup.py test
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        /usr/bin/python2 setup.py install --root="$pkgdir" --prefix=/usr
}
