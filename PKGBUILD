# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-fontools
pkgver=0.4.3
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
sha1sums=('a1e44d3939e0d838634aff0842d0f573b30391fb')

build() {
    cd "$srcdir/FONtools-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/FONtools-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
