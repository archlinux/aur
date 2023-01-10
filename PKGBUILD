# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-fontools
pkgver=0.6.0
pkgrel=1
pkgdesc="FONtools: The Feature Object Notation tools"
arch=("any")
url="https://sr.ht/~vejnar/FONtools"
license=("MPLv2")
depends=('python'
         'python-pyfnutils'
         'python-pyfaidx')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/FONtools/archive/v${pkgver}.tar.gz")
sha256sums=('2cd784f2a5aaef4114400832e1b9fa0c9eba8a6e0f2591d396510c27ece8aae0')

build() {
    cd "$srcdir/FONtools-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/FONtools-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
