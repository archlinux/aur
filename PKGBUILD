# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-objgraph
pkgver=1.8.1
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
arch=(any)
url="http://mg.pov.lt/objgraph"
license=('custom: MIT')
optdepends=('graphviz: generate images of reference graphs'
            'xdot: interactively view object graphs')
makedepends=('python' 'python-setuptools')

source=("http://pypi.python.org/packages/source/o/objgraph/objgraph-$pkgver.tar.gz")
sha256sums=('b4d4628adf39176beeb881fc575832256756bf0d73c1746b2b3529fd309b1a67')

build() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
