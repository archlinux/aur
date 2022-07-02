# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=2.6.3
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
depends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")

sha256sums=('77f54cc1bfd970e38312ea9d7b8e060357f9fa4eacba7ae46487a2a154ca796b')

build() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
