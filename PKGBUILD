# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-labxpipe
pkgver=0.2.0
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
sha1sums=('304c6c80dfef6086587235b412f2456e30641fc6')

build() {
    cd "$srcdir/LabxPipe-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/LabxPipe-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
