# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='git-contrib-tree'
pkgver=0.1.1
pkgrel=1
pkgdesc='Analyze git repository contributions and display a tree of files with top contributors for each.'
arch=('any')
url='https://gitlab.com/wykwit/git-contrib-tree'
license=('MIT')
depends=('git' 'python3')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('e4e6e4b4ea274ed6c9aee1ef80399c4ab07bf955d115b5770a79a85cd1c4bdb6')

build() {
    cd $pkgname-v$pkgver

    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-v$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
}
