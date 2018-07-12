# Maintainer: desbma
pkgname=sacad
pkgver=2.1.6
pkgrel=2
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ec989b9b93f1234909b21abd82bfc508db81f735c61d3b38abb61a10497f5e239fc3a6a9d436f971e1b797d9adb081cbf82f4cf62df6e6834e2d1737aa2316e6')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache bitarray
    python setup.py install --root="${pkgdir}"
}
