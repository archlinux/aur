# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: noirscape <deepnavy at waifu dot club>

pkgname=tubeup
pkgver=2024.12.21
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
arch=('any')
url="https://github.com/bibanon/tubeup"
license=('GPL-3.0-or-later')
depends=('python' 'python-docopt' 'python-internetarchive' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81c12f7f76fb43cb5c7b38f85d5a35496256fecd1e6e5792f41a9f4acb104c75')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
