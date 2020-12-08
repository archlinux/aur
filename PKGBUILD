# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-phabricator
pkgver=0.8.0
pkgrel=1
pkgdesc='Python bindings for Phabricator'
url='https://github.com/disqus/python-phabricator'
arch=('any')
license=('Apache2')
depends=('python')
source=("https://files.pythonhosted.org/packages/e6/1a/2a1993aa5e32ad22eed3fa3f95cdea69997837706f3f25cad74c8e7134b1/phabricator-$pkgver.tar.gz")
sha256sums=('9e2dc2a924ce2fa9e908807fee3670d7484943c65442a60d51fb1ec138e1d71f')

build() {
    cd phabricator-$pkgver
    python setup.py build
}

package() {
    cd phabricator-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
