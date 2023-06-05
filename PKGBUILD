# Maintainer: Matej Dujava <mdujava (plus) aur (at) kocurkovo (dot) cz>

pkgname=python-sphinxcontrib-httpdomain
_libname=sphinxcontrib-httpdomain
pkgver='1.8.1'
pkgrel='1'
pkgdesc="HTTP domain extension for sphinx"
arch=('any')
url="https://github.com/sphinx-contrib/httpdomain"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-sphinx')
source=("https://github.com/sphinx-contrib/httpdomain/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c58e5874474f6b9b2100d6bddb2140d8a82d459cd20cd62342405c7e84811a6')


build() {
    cd httpdomain-${pkgver}
    python setup.py build
}

package(){
    cd httpdomain-${pkgver}
    python setup.py install -O1 --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
