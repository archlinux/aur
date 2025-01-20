# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-pytest-recording
pkgver=0.13.2
pkgrel=1
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgdesc='Pytest plugin to record network interactions with VCR.py'
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=(python python-vcrpy python-pytest)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('000c3babbb466681457fd65b723427c1779a0c6c17d9e381c3142a701e124877')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
