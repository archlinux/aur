# Maintainer:
# Contributor: noirscape <deepnavy at waifu dot club>

pkgname=tubeup
pkgver=2024.11.13
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
arch=('any')
url="https://github.com/bibanon/tubeup"
license=('GPL-3.0-or-later')
depends=('python' 'python-docopt' 'python-internetarchive' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c4898338d7fbfb9af2fb7e0fe83182ce8976fb780ed21927a543e69eef84d63')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
