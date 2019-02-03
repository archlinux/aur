# Maintainer: Marko Korhonen <reekymarko@reekynet.com>

pkgname=beets-check
pkgver=0.9.2
pkgrel=1
pkgdesc="Verify and store checksums in your beets library"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname}"
license=('MIT')
depends=('python' 'beets>=1.4.3')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('a3ce981ec14e1cd355587149266a4302')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    rm 'beetsplug/__init__.py'
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
