pkgname=python2-typing
# Do not update this further. Version 4.0.0 dropped support for Python 2
pkgver=3.10.0.2
pkgrel=1
pkgdesc="Backport of the standard library typing module to Python versions older than 3.6 (Legacy Python 2 version)"
url="https://pypi.python.org/pypi/typing"
arch=('any')
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("python2-typing-$pkgver.tar.gz::https://github.com/python/typing/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f77651a11ed494a8444520c812d208f62dfa18a5b6d591ffed29d5719bf79975')

build() {
    cd typing-$pkgver
    python2 setup.py build
}

package() {
    cd typing-$pkgver
    python2 setup.py install --root "$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
