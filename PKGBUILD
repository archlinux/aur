# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=python-download-npo
_module='download-npo'
pkgver=2.9.1
pkgrel=2
pkgdesc="Download videos from the Dutch npo.nl site."
url="http://arp242.net/code/download-npo"
depends=('python' 'hicolor-icon-theme')
makedepends=('python-setuptools')
optdepends=('tk: Graphical frontend'
            'libmms: Download older MMS videos'
            'python-mutagen: Update metada of downloaded files')
license=('MIT')
arch=('any')
source=("https://github.com/Carpetsmoker/download-npo/archive/version-${pkgver}.tar.gz")
sha256sums=('b7a69f55b31750f1f12842cbb4f133442986abba4b3a2533a522d6c5af42bc68')

build() {
    cd "$srcdir/${_module}-version-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_module}-version-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
