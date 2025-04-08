# Maintainer: devome <evinedeng@hotmail.com>

pkgname=dottorrent-cli
pkgver=1.10.3
pkgrel=1
pkgdesc="CLI tool for creating .torrent files"
url="https://github.com/kz26/${pkgname}"
arch=('any')
license=('MIT')
depends=("python-dottorrent" "python-humanfriendly" "python-tqdm")
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bcd0f2b6e06871b29b27b4c9db36f611bd866b48613937c3f0bec269e9e86366')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
