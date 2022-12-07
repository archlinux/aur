# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-fontools
pkgver=0.5.1
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
sha256sums=('87798a5dfd904f0cdba89d9399ad17539be6b913c55f9802a4642687cfb85adb')

build() {
    cd "$srcdir/FONtools-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/FONtools-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
