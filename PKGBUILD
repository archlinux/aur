# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=python-download-npo
_module='download-npo'
pkgver=2.9
pkgrel=4
pkgdesc="Download videos from the Dutch npo.nl site."
url="http://arp242.net/code/download-npo"
depends=('python' 'hicolor-icon-theme')
optdepends=('tk: Graphical frontend'
            'libmms: Download older MMS videos'
            'python-mutagen: Update metada of downloaded files')
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/23/cc/586465c1ac371cfbde35e2cc2a4cf3bee79745df2cd4ac110e61ffeba21e/download-npo-2.9.tar.gz'
        'LICENSE')
sha256sums=('b1819f9c536d90588f4cf8a02651d925600957c2d86e6c6817b2dcae6f023a10'
            '6976e1dd59a0e0fb1b0e32a8a53eb6502485550be941560bcacb78901e5cd096')

build() {
    cd "$srcdir/${_module}-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/${_module}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
