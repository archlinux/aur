# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-labxdb-tools
pkgver=0.6.0
pkgrel=1
pkgdesc="LabxDB tools"
arch=("any")
url="https://gitlab.com/vejnar/LabxDB-tools"
license=("MPLv2")
depends=('python'
         'python-pyfnutils'
         'python-requests')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vejnar/LabxDB-tools/archive/v${pkgver}.tar.gz")
sha1sums=('0359557e3671a6de60a2d4e2f211ce771bd48745')

build() {
    cd "$srcdir/LabxDB-tools-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/LabxDB-tools-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
