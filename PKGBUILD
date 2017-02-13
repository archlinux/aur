pkgname=repren
pkgver=0.3.9
pkgrel=1
pkgdesc="Multi-pattern string replacement and file renaming, a command-line search-and-replace swiss army knife"
arch=(any)
url="https://github.com/jlevy/repren"
license=("Apache")
depends=("python2")
sha1sums=('8e5d48f8d1aed2aa148e47c2a63170e053eb4ce3')
source=("https://github.com/jlevy/repren/archive/$pkgver.tar.gz")

build() {
cd "$srcdir/repren-$pkgver"
sed -i '1c#!/usr/bin/env python2' repren
python2 setup.py build
}

package() {
cd "$srcdir/repren-$pkgver"
python2 setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr" 
install -m644 -D README.md "$pkgdir/usr/share/doc/repren/README.md"
}
