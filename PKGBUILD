# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-objgraph
pkgver=3.0.0
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
arch=(any)
url="http://mg.pov.lt/objgraph"
license=('custom: MIT')
optdepends=('graphviz: generate images of reference graphs'
            'xdot: interactively view object graphs')
makedepends=('python' 'python-setuptools')

source=("http://pypi.python.org/packages/source/o/objgraph/objgraph-$pkgver.tar.gz")
sha256sums=('1f222e1f318e4a940693bdc194d2d512ba90d9e8ea5717097b38066b1d895d24')

build() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
