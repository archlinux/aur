# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=python-types-pygments
pkgver=2.21.0.20260819
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
sha256sums=('68e0cb27115b08b681c843e30a153b5d9850c048e1158623ada36ccd4cf7e89b')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
