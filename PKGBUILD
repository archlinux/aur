# Maintainer: Marko Korhonen <reekymarko@reekynet.com>

pkgname=beets-check
pkgver=0.13.0
pkgrel=1
pkgdesc="Verify and store checksums in your beets library"
arch=('any')
url="https://github.com/geigerzaehler/beets-check"
license=('MIT')
depends=('python>=3.7' 'beets>=1.4.7')
source=("https://github.com/geigerzaehler/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8343240c1e4e4c2496f924b8c2faf042')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
