# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-tracing
pkgver=0.8
pkgrel=2
pkgdesc="Python debug logging helper"
arch=('any')
url="http://liw.fi/tracing/"
license=('GPL3')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-tracing/python-tracing_$pkgver.orig.tar.gz")
sha256sums=('808a064cc5fd1972fb07a7d72b4069cbff284ac7077bcd90eb2ce79d8b5c9ed0')

build() {
    cd "$srcdir/python-tracing-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-tracing-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    #install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
