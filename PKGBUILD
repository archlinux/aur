# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-types-tqdm'
_module='types-tqdm'
_src_folder='types-tqdm-4.66.0.20240106'
pkgver='4.66.0.20240106'
pkgrel=1
pkgdesc="Typing stubs for tqdm"
url="https://github.com/python/typeshed"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/de/89/deab00a2d1aa7e5d6e415dbf5ba7a2a444ac5f194f3fd24a0ca611d6864f/types-tqdm-4.66.0.20240106.tar.gz")
sha256sums=('7acf4aade5bad3ded76eb829783f9961b1c2187948eaa6dd1ae8644dff95a938')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
