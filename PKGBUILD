# Maintainer: vyzu
pkgname='python-goodreads'
_module='Goodreads'
_src_folder='goodreads-0.3.2'
pkgver='0.3.2'
pkgrel=1
pkgdesc="Python wrapper for Goodreads API"
url="https://github.com/sefakilic/goodreads/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/ef/6e/5aef0dd1819ed7b89be1a05f731a9727b8f6eba3d20bd4005104e82178c4/goodreads-0.3.2.tar.gz")
sha256sums=('3a0b311a0b1a6b35bbff09b9e67e80a76ecb77720b2e81a682ac5e018ad35445')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
