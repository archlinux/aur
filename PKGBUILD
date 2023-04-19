# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-geneabacus
pkgver=0.2.1
pkgrel=1
pkgdesc="Python IO functions for GeneAbacus"
arch=("any")
url="https://git.sr.ht/~vejnar/GeneAbacus-python"
license=("MPLv2")
depends=('python'
         'python-lz4'
         'python-numpy')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/GeneAbacus-python/archive/v${pkgver}.tar.gz")
sha256sums=('0d12b676f1c804678261699a26cf97e0570f7076b6661d7569652e960f4d12d5')

build() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
