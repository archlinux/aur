# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-pytest-recording
pkgver=0.13.0
pkgrel=2
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgdesc='Pytest plugin to record network interactions with VCR.py'
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=(python python-vcrpy python python-pytest python-attrs)
makedepends=(python-build python-installer python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b24b707af843341457d9d340328f361eceb0efe980e388341941b4fada3745ca')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
