# Maintainer: Jose Riha <jose1711 gmail com>
#
pkgbase=python-textual-dev
pkgname=('python-textual-dev')
_module='textual-dev'
pkgver=1.5.1
pkgrel=1
pkgdesc="Development tools for working with Textual"
url="https://github.com/Textualize/textual-dev"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('e0366ab6f42c128d7daa37a7c418e61fe7aa83731983da990808e4bf2de922a1')

build() {
    cd "${srcdir}/textual_dev-${pkgver}"
    poetry build
}

package() {
    cd "${srcdir}/textual_dev-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
