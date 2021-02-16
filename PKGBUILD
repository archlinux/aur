# Maintainer: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=beets-alternatives
pkgver=0.10.2
pkgrel=1
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname}"
license=('MIT')
depends=('python' 'beets>=1.4.7')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('4c514d81575ce182fe7c7709c9007f00f6d29a988f2cffe732fb32a0c38f9ae82c0bb1f14ceebd884efe2a495c0194dc2b0341312cd970dc3da908107dcd67e8')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
