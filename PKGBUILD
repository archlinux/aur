# Maintainer: desbma
pkgname=sacad
pkgver=2.1.2
pkgrel=2
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a97ae7f020cd9819804fc9b1b108f87e0017bc6ba416d5abf7a60b71cfa8265159c0365ee6fbe33196a7e7f5ba2ceaa84115d2094432797d29dea9d5494f2368')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
