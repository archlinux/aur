# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=2.7.2
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python'
         'python-aiohttp'
         'python-appdirs'
         'python-bitarray'
         'python-cssselect'
         'python-lxml'
         'python-mutagen'
         'python-pillow'
         'python-setuptools'
         'python-tqdm'
         'python-unidecode')
optdepends=('jpegoptim: for automatic lossless JPEG crunching'
            'optipng: for automatic lossless PNG crunching')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('50d6a0ab6cf9d85e83962cf2964b188b96513d93119b0f6bf43a1165688aa4a8abb6f0daba4ed983a97e0b7e79470cadd2a276914753ab4bf3518f07e44a2ee8')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
