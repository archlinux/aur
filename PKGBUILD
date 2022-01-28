# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-pyfaidx
pkgver=0.6.3.1
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools" "python-setuptools-scm")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("326771de48bdee2ee7f9254e309a9fa8facb65a9")

build() {
    cd $srcdir/pyfaidx-$pkgver

    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
