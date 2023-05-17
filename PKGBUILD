# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-labxpipe
pkgver=0.7.0
pkgrel=1
pkgdesc="Genomics pipelines"
arch=("any")
url="https://sr.ht/~vejnar/LabxPipe"
license=("MPLv2")
depends=('python'
         'python-labxdb-tools'
         'python-pyfnutils'
         'python-xlsxwriter')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/LabxPipe/archive/v${pkgver}.tar.gz")
sha256sums=('0027a512ee80feffa47d8f1928402c0f1a4c6ae4d11d414f207cb81a495ecc77')

build() {
    cd "$srcdir/LabxPipe-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/LabxPipe-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
