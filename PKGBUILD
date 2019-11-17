_name=${pkgname#python-}
pkgname=python-itunespy
pkgver=1.5.3
pkgrel=1
pkgdesc="itunespy is a simple library to fetch data from the iTunes Store API made for Python 3.X."
arch=('any')
source=("https://github.com/sleepyfran/itunespy/archive/$pkgver.tar.gz")
md5sums=("720114c60742ac0b9f8bbb2ace7b50dc")
url="https://github.com/sleepyfran/itunespy"
license=('MIT')
depends=(python python-requests)
build() {
    cd $srcdir/itunespy-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/itunespy-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
