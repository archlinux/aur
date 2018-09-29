# Maintainer: desbma
pkgname=sacad
pkgver=2.1.7
pkgrel=1
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('606f07a57725dadf86821975bf83012f7e5048cd66b765f42735bbf09c3d4562062aea828d7d5e56cd5d23d7f0cf11f5998f7298b33e57fb3c6367d40794a4b7')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache bitarray
    python setup.py install --root="${pkgdir}"
}
