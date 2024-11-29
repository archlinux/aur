_module='matchering'
pkgname=python-$_module
_src_folder='matchering-2.0.6'
pkgver='2.0.6'
pkgrel=1
pkgdesc="Audio Matching and Mastering Python Library"
url="https://github.com/sergree/matchering"
depends=('python' 'libsndfile')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('custom:GNU General Public License v3 (GPLv3)')
arch=('any')
source=("https://files.pythonhosted.org/packages/13/a2/8dd0e1f3da3a6f4d50d1f06f91117370844edb9e8cce1ff798a7cdc0cece/matchering-2.0.6.tar.gz")
sha256sums=('683f5ff76b1a2f1e852c79108cfccfdab4baf901357a97d38555b4da5d5c5a25')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
