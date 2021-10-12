# Maintainer: luzea <me at luzea dot de>

pkgname='python-estuary'
pkgver=0.0.2
pkgrel=1
pkgdesc='API wrapper for Estuary written in Python.'
arch=('any')
url='https://github.com/luzeadev/python-estuary'
license=('MIT')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/62/4a/f1c3b1208a7523a21804063677f282d4f0f04dcbae4a7d6b3f667da4cf4f/estuary-0.0.2.tar.gz')
sha256sums=('aaa2ac887fdb026b4714ebe342bdc70b85c46e1eeaac4331c6b51d9cac23e501')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
