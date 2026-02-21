# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: noirscape <deepnavy at waifu dot club>

pkgname=tubeup
pkgver=2026.2.19
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
arch=('any')
url="https://github.com/bibanon/tubeup"
license=('GPL-3.0-or-later')
depends=('python' 'python-docopt' 'python-internetarchive' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7d57d90677418ddd1481377e9832e17e80c6ffa36c47137fbbef18ea5e224c7c')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
