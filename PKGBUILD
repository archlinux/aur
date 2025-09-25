# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=cloneholio
pkgver=0.15.1
pkgrel=1
pkgdesc="Maintain local backups of *all Git repositories* belonging to a user or group."
url="https://github.com/nvllsvm/cloneholio"
depends=('python' 'python-arrow' 'python-gitpython' 'python-pygithub' 'python-requests' 'python-tqdm')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('18214df4846b899f4e922d0e119847e3b19f7631c81b78cbb7bca28760d6542b')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
