# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=2.7.5
pkgrel=3
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
sha512sums=('e6fffeaf32d9672c44c7752511ded313ec4c8f116071c15dfc15b8909c263e00ce1e780a0b6afe7f77849caf38e38669a5c6c811ab8e572eddff010693b8103e')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
