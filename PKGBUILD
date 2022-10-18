# Maintainer: Andrea Cattaneo <aur@runme.sh>
pkgname=i3altlayout
pkgver=1.1.1
pkgrel=1
epoch=0
pkgdesc="i3wm efficient screen real estate"
arch=('any')
url="https://github.com/deadc0de6/i3altlayout"
license=("GPL-3.0")
depends=("python-i3ipc" "python-docopt")
makedepends=("python-setuptools" "tar")
source=("${pkgname}.tar.gz::https://github.com/deadc0de6/i3altlayout/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("SKIP")

build() {
    tar xfz "${pkgname}.tar.gz"
    cd "$pkgname-${pkgver}"
    python setup.py build
}
package() { 
    cd "$pkgname-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
