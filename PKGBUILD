# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: noirscape <deepnavy at waifu dot club>

pkgname=tubeup
pkgver=2026.5.8
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
arch=('any')
url="https://github.com/bibanon/tubeup"
license=('GPL-3.0-or-later')
depends=('python' 'python-docopt' 'python-internetarchive' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f5bc9195312087de29ca98f7532f800d98174a5f11764522ea3768cc420cb234')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
