# Maintainer: Jasur Sadikov <jasur@sadikoff.com>
pkgname=mud-git
pkgver=1.0.5
pkgrel=1
pkgdesc="Multi repository git utility. Manage multiple git-repositories simultaneously."
arch=('any')
url="https://github.com/jasursadikov/mud"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'python' 
    'python-prettytable' 
    'git')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-setuptools'
    'python-setuptools-scm'
)
source=("git+${url}.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/mud"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mud"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mud/LICENSE"
}
