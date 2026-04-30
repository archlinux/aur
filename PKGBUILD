# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-swift
pkgname=python-tree-sitter-swift
pkgver=0.0.1
pkgrel=7
pkgdesc="Swift grammar for tree-sitter"
arch=('any')
url="https://github.com/alex-pinkus/tree-sitter-swift"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/37/f7/35337caea29e24bb2f55d0499db53bcb879ff0eb2011e1fa567d5edab4b7/tree_sitter_swift-0.0.1.tar.gz")
sha256sums=('d43b0baf413ba4b049f92eadc074805cb6403655c905d3af24f12fce1c9f561b')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
