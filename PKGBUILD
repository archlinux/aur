# Maintainer: desbma
pkgname=sacad
pkgver=2.1.4
pkgrel=2
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('68a8614bdc1c8b32bcd074bbc6b963441bf537fd105cb849152275b9d22d19a9bd152abd8016b48c37b1bbdc826966be44523d84f8513bdc26d39635c5ed4e87')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
