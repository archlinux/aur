# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-labxdb-tools
pkgver=0.7.0
pkgrel=1
pkgdesc="LabxDB tools"
arch=("any")
url="https://sr.ht/~vejnar/LabxDB"
license=("MPLv2")
depends=('python'
         'python-pyfnutils'
         'python-requests')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/LabxDB-tools/archive/v${pkgver}.tar.gz")
sha256sums=('5fbcd424e95e694239a39c8874a31324e47b4d7e1a19353dfd1c67cf96e22033')

build() {
    cd "$srcdir/LabxDB-tools-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/LabxDB-tools-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
