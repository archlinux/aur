# Maintainer: desbma
pkgname=sacad
pkgver=2.1.5
pkgrel=2
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('10e0eb71b799b4d74f0afae347692db5ad3a9d2cb04aa8968272f6f35966709e4114ca2e2a87db10e732b9d0c93c906f235024e77b68724c4a4f08df6763074f')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
