# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python2-readlike
pkgver=0.1.2
pkgrel=1
pkgdesc="GNU Readline-like line editing module"
url="http://jangler.info/code/readlike"
depends=('python2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/r/readlike/readlike-$pkgver.tar.gz")
md5sums=('26caff8f77a1646996a3bd303c79ce18')

build() {
    cd $srcdir/readlike-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/readlike-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
