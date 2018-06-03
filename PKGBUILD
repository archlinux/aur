# Maintainer: desbma
pkgname=sacad
pkgver=2.1.1
pkgrel=2
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('057abf036a3e40c9fa84b89eb1fcf18aa85176e6973161d6a8bf730eb64da5f16634a59c5b0f04f9efa5b11cdcd61d8b302c14ef5266608b2734620914709463')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
