# Maintainer: Andrea Cattaneo <aur@runme.sh>
pkgname=i3altlayout
pkgver=1.1.2
pkgrel=1
epoch=0
pkgdesc="i3wm efficient screen real estate"
arch=('any')
url="https://github.com/deadc0de6/i3altlayout"
license=("GPL-3.0")
depends=("python-i3ipc" "python-docopt")
makedepends=("python-setuptools" "tar")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deadc0de6/i3altlayout/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("54f695a0502452df482cf8aa8f69ddea1d4cd0420a60044d4e8eb233bc76ae73")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}
package() { 
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
