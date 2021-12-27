_name=${pkgname#python-}
pkgname=python-itunespy
pkgver=1.6
pkgrel=2
pkgdesc="itunespy is a simple library to fetch data from the iTunes Store API made for Python 3.X."
arch=('any')
source=("https://github.com/fgzv/itunespy/archive/1.6.tar.gz")
md5sums=("c8e706fa3e2397299ef860d06e0ac5cf")
url="https://github.com/sleepyfran/itunespy"
license=('MIT')
depends=(python python-requests python-pycountry)
makedepends=(python-setuptools)
build() {
    cd $srcdir/itunespy-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/itunespy-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
