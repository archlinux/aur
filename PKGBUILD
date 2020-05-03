# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <contact@acidhub.click>

pkgname=steam-tools
_pkgname=steam-tools-ng
pkgver=0.9.4
pkgrel=2
pkgdesc="Some useful tools to use with steam client or compatible programs and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python' 'python-aiodns' 'python-cchardet' 'python-ujson' 'python-aiohttp' 'python-beautifulsoup4' 'python-requests' 'python-crypto' 'python-certifi')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('fc1dd71f0cf764f734a5b2aaff7c5483e280c2b1a0fe944d8e3130df96f854df')

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --skip-build --optimize=1 --root=${pkgdir} --prefix=/usr
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
    cp -rf icons/* $pkgdir/usr/share/steam-tools-ng/icons/
}


