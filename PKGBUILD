# Maintainer: Marko Korhonen <reekymarko@reekynet.com>

pkgname=beets-check
pkgver=0.12.0
pkgrel=1
pkgdesc="Verify and store checksums in your beets library"
arch=('any')
url=""
license=('MIT')
depends=('python' 'beets>=1.4.3')
source=("https://github.com/geigerzaehler/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3713ab4aa776f40dd00d9867323b4204')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
