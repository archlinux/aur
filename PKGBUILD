# Maintainer: Marko Korhonen <reekymarko@reekynet.com>

pkgname=beets-check
pkgver=0.15.0
pkgrel=1
pkgdesc="Verify and store checksums in your beets library"
arch=('any')
url="https://github.com/geigerzaehler/beets-check"
license=('MIT')
depends=('python' 'beets>=1.4.7')
source=("https://github.com/geigerzaehler/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0f344c245196ba0e0abd70cad24c98cc')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    pipylib=$(/usr/bin/python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
    install -Dm644 beetsplug/check.py "$pkgdir${pipylib}/beetsplug/check.py"
    touch "$pkgdir${pipylib}/beetsplug/__init__.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
