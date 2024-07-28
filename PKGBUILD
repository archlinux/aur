# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=2.8.0
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
sha512sums=('d6615f8834c54e5b10a4bbe210707079f3d783436bb951adebb0d9cbd4354a57f8d62a4e02b7420fcf1b98132feb4d263b5633fe4f148b4adae1291aabf1e413')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
