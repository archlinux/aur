# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=nevow
pkgver=0.14.2
pkgrel=1
pkgdesc="web application construction kit written in Python"
arch=('any')
url='http://pypi.python.org/pypi/Nevow'
license=('custom')
makedepends=('python2-setuptools')
depends=('python2' 'python2-twisted')

source=("https://pypi.python.org/packages/d1/7b/fb5906c29c2397177e7df12febcd8049610258c97add082131779d0bf49a/Nevow-${pkgver}.tar.gz")
md5sums=('d35d9aaac3f0004c5df2233ec8dfa080')

build(){
    cd "$srcdir/Nevow-$pkgver"
    python2 setup.py build
}

package(){
    cd "$srcdir/Nevow-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --install-data=/usr/share/"$pkgname"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
