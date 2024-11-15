_name=${pkgname#python-}
pkgname=python-itunespy
pkgver=1.6.1
pkgrel=1
pkgdesc="itunespy is a simple library to fetch data from the iTunes Store API made for Python 3.X."
arch=('any')
url="https://github.com/sleepyfran/itunespy"
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("41eac172835cb440016a5d835f188e9cda72f3291983e35f44e2f2c9ceed6663784789761e88784e42f4586d5dcd0471661a8bec7586ea1b429d54419277aefe")
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
