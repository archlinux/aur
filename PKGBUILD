# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=python-types-pygments
pkgver=2.20.0.20260728
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgrel=1
pkgdesc='Typing stubs for Pygments'
url="https://github.com/python/typeshed"
depends=('python')
makedepends=(
    'python-build' 'python-installer' 'python-setuptools'
)
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dd0a49d84fd9e3f08ab3a3191779e4732a91bb1fad2e80178cf4574e8f35684d')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
