# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=2.8.3
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
         'python-tqdm'
         'python-unidecode')
optdepends=('jpegoptim: for automatic lossless JPEG crunching'
            'optipng: for automatic lossless PNG crunching'
            'oxipng: for automatic lossless PNG crunching')
makedepends=('python-pip' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('414ff643da69b154592e5d3d4176d8824e04ea118585097e2adc4791fd1c19552968e677a914fda1091c718015c7a1a629f065e5d7c86c9feb9589b0c9aa187e')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
