# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python2-pyxdg
pkgver=0.25
pkgrel=1
pkgdesc="PyXDG contains implementations of freedesktop.org standards in python."
url="http://freedesktop.org/wiki/Software/pyxdg"
depends=('python2')
license=('LGPL2')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pyxdg/pyxdg-$pkgver.tar.gz")
md5sums=('bedcdb3a0ed85986d40044c87f23477c')

build() {
    cd "$srcdir/pyxdg-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/pyxdg-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
