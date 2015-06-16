# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python2-objgraph
pkgver=2.0.0
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
arch=(any)
url="http://mg.pov.lt/objgraph"
license=('custom: MIT')
optdepends=('graphviz: generate images of reference graphs'
            'xdot: interactively view object graphs')
makedepends=('python2' 'python2-setuptools')

source=("http://pypi.python.org/packages/source/o/objgraph/objgraph-$pkgver.tar.gz")
sha256sums=('ef28c01b5bce17bbc463c792a6709bac3cf698cd222e911be3f522ac9b38c9bc')

build() {
    cd "$srcdir/objgraph-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/objgraph-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
