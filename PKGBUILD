# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=python-download-npo
_module='download-npo'
pkgver=2.9.1
pkgrel=1
pkgdesc="Download videos from the Dutch npo.nl site."
url="http://arp242.net/code/download-npo"
depends=('python' 'hicolor-icon-theme')
optdepends=('tk: Graphical frontend'
            'libmms: Download older MMS videos'
            'python-mutagen: Update metada of downloaded files')
license=('MIT')
arch=('any')
source=("https://github.com/Carpetsmoker/download-npo/archive/version-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('b7a69f55b31750f1f12842cbb4f133442986abba4b3a2533a522d6c5af42bc68'
            '6976e1dd59a0e0fb1b0e32a8a53eb6502485550be941560bcacb78901e5cd096')

build() {
    cd "$srcdir/${_module}-version-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/${_module}-version-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
