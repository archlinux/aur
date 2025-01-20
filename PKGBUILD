# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-types-beautifulsoup4'
pkgver='4.12.0.20240106'
_name=${pkgname#python-}
# For some reason, of all typing stub packages I've investigated, pypi leaves
# this one intact
# _name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgrel=2
pkgdesc="Typing stubs for beautifulsoup4"
url="https://github.com/python/typeshed"
depends=('python')
makedepends=(
    'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('98d628985b71b140bd3bc22a8cb0ab603c2f2d08f20d37925965eb4a21739be8')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
