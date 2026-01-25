# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='git-contrib-tree'
pkgver=0.2.0
pkgrel=1
pkgdesc='Analyze git repository contributions and display a tree of files with top contributors for each.'
arch=('any')
url='https://gitlab.com/wykwit/git-contrib-tree'
license=('MIT')
depends=('git' 'python3')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('fae416d3841e9e68607a5d528690f486c7660f29ac462f3752b45081d8747887')

build() {
    cd $pkgname-v$pkgver

    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-v$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
}
