# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=2.3.3
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
depends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")

sha256sums=('9d2053785669560294bb1154e0431f3a881d0c1d75db939a521d3bf088e22191')

build() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('ee78ba35a9de55df10598e0f78c124b69f0bed8cce4b2a961c513df049ff0d2e')
