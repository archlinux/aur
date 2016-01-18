# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-tracing
pkgver=0.9
pkgrel=2
pkgdesc="Python debug logging helper"
arch=('any')
url="http://liw.fi/tracing/"
license=('GPL3')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-tracing/python-tracing_$pkgver.orig.tar.xz")
sha256sums=('b44cafd2fac5d4c43a72af6082f0d3240a00f832f1d1e0ef74f69f8a4759106f')

build() {
    cd "$srcdir/python-tracing-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-tracing-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    #install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
