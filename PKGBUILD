# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-types-pygments'
pkgver='2.17.0.20240106'
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgrel=2
pkgdesc='Typing stubs for Pygments'
url="https://github.com/python/typeshed"
depends=('python')
makedepends=(
    'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('92e62ac37793e567cd2b0f64f1456c24fccce4041d9c5f869697a6739fde4fce')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
