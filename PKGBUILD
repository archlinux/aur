# Maintainer: Jose Riha <jose1711 gmail com>
#
pkgbase='python-textual-dev'
pkgname=('python-textual-dev')
_module='textual-dev'
pkgver='1.2.1'
pkgrel=1
pkgdesc="Development tools for working with Textual"
url="https://github.com/Textualize/textual-dev"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('0bda11adfc541e0cc9e49bdf37a8b852281dc2387bb6ff3d01f40c7a3f841684')

build() {
    cd "${srcdir}/textual_dev-${pkgver}"
    poetry build
}

package() {
    cd "${srcdir}/textual_dev-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
