# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=1.5.1
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")

sha256sums=('b22b0f568475ebf5e2a92e7a69c7ca0962dc1f16a4da01bd3b52cb438f5b45f7')

build() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
