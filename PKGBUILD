# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.9.8
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.5.1' 'python-spark-parser<1.6.0' 'python-xdis>=3.2.4' 'python-xdis<3.3.0')
source=("https://pypi.python.org/packages/b7/b7/7bfa555ab79555da9eb6c6713900be6899cd0d41bd3b79345d5beed42b7b/uncompyle6-${pkgver}.tar.gz")
sha256sums=('ec5d1ccf65b92b05a5900348ebf898c6e18fb533418e0a9198d6271c84197202')

build() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py install --root="$pkgdir"
}
