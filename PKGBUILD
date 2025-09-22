# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=cloneholio
pkgver=0.15.0
pkgrel=1
pkgdesc="Maintain local backups of *all Git repositories* belonging to a user or group."
url="https://github.com/nvllsvm/cloneholio"
depends=('python' 'python-arrow' 'python-gitpython' 'python-pygithub' 'python-requests' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-pdm-backend')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e3cac250700831130dc9c245da3b0588d7fd8e671b1e042f35967acb36dc656e')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
