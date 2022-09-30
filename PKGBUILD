pkgname=python2-typing
pkgver=3.10.0.0
pkgrel=1
pkgdesc="Backport of the standard library typing module to Python versions older than 3.6"
url="https://pypi.python.org/pypi/typing"
arch=('any')
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("python2-typing-$pkgver.tar.gz::https://pypi.io/packages/source/t/typing/typing-$pkgver.tar.gz")
sha256sums=('13b4ad211f54ddbf93e5901a9967b1e07720c1d1b78d596ac6a439641aa1b130')

build() {
    cd typing-$pkgver
    python2 setup.py build
}

package() {
    cd typing-$pkgver
    python2 setup.py install --root "$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
