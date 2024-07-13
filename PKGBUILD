# Maintainer:
# Contributor: noirscape <deepnavy at waifu dot club>

pkgname=tubeup
pkgver=2023.08.19
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
arch=('any')
url="https://github.com/bibanon/tubeup"
license=('GPL-3.0-or-later')
depends=('python' 'python-docopt' 'python-internetarchive' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9b90ef4145678021b849a4f558803131467e55e14b159c313728c7b96d563c93')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
