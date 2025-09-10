# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=cloneholio
pkgver=0.14.0
pkgrel=1
pkgdesc="Maintain local backups of *all Git repositories* belonging to a user or group."
url="https://github.com/nvllsvm/cloneholio"
depends=('python' 'python-arrow' 'python-gitpython' 'python-pygithub' 'python-requests' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-pdm-backend')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8355e65adbe285c5d629ca25a38a6d9f5d13c5c2894a0c5a37e3f9e8842837c2')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
