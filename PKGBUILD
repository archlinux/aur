# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-objgraph
pkgver=3.1.1
pkgrel=1
pkgdesc="Draws Python object reference graphs with graphviz"
arch=(any)
url="http://mg.pov.lt/objgraph"
license=('custom: MIT')
optdepends=('graphviz: generate images of reference graphs'
            'xdot: interactively view object graphs')
makedepends=('python' 'python-setuptools')

source=("https://pypi.python.org/packages/be/58/9ca81a20cc837054e94866df1475d899caaa94f3732b8a46006858b015f7/objgraph-${pkgver}.tar.gz")
sha256sums=('8c2de13d7d68235eab95d115f5f95c230c5648874006d391dc3cdaa83823589d')

build() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/objgraph-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
