# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=2.7.3
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
sha512sums=('5a900bb9d7cfcf77d9ba16bc17624b0551fb3040d7fadeb63b9e044907082d33329aa921697dec12a0bdff250319112d44b5071f33a80f0a2207a84e06c9aa3c')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
