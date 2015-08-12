# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python2-objgraph
pkgver=2.0.1
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
arch=(any)
url="http://mg.pov.lt/objgraph"
license=('custom: MIT')
optdepends=('graphviz: generate images of reference graphs'
            'xdot: interactively view object graphs')
makedepends=('python2' 'python2-setuptools')

source=("http://pypi.python.org/packages/source/o/objgraph/objgraph-$pkgver.tar.gz")
sha256sums=('841de52715774ec1d0e97d9b4462d6e3e10406155f9b61f54ba7db984c45442a')

build() {
    cd "$srcdir/objgraph-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/objgraph-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
