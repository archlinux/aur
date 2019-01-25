# Maintainer: desbma
pkgname=sacad
pkgver=2.1.9
pkgrel=2
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-bitarray' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm')
optdepends=('jpegoptim: for automatic lossless JPEG crunching'
            'optipng: for automatic lossless PNG crunching')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('14ab37ffad2d39f0929a24a4c7b298bc80473d953dc59b982329847f94f70aee3079b983177cae290f0ee98a3e2719f893291b0025900c8b41d10e9456ac3a53')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
