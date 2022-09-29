# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-labxpipe
pkgver=0.1.2
pkgrel=1
pkgdesc="LabxPipe"
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
sha1sums=('8732b1c2c1405b68d69af889c3d8f0f02cab77b3')

build() {
    cd "$srcdir/LabxPipe-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/LabxPipe-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
