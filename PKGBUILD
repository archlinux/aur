# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='git-contrib-tree'
pkgver=0.2.1
pkgrel=1
pkgdesc='Analyze git repository contributions and display a tree of files with top contributors for each.'
arch=('any')
url='https://gitlab.com/wykwit/git-contrib-tree'
license=('MIT')
depends=('git' 'python3')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6917aef97d62647723e279f1418c4caa40d9df7ad98e52f40647a6bf24102e61')

build() {
    cd $pkgname-v$pkgver

    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-v$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
}
