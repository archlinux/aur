# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=cloneholio
pkgver=0.16.0
pkgrel=1
pkgdesc="Maintain local backups of *all Git repositories* belonging to a user or group."
url="https://github.com/nvllsvm/cloneholio"
depends=('python' 'python-arrow' 'python-gitpython' 'python-pygithub' 'python-requests' 'python-tqdm')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e16942c887c424c8a7b89a2eb619dbae13b39376c107c42da531b9bf8613d763')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
