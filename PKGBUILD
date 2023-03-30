# Maintainer: Dmitry Olyenyov <dmitry.olyenyov@gmail.com>
pkgname=python-broadlink
pkgver=0.18.3
pkgrel=1
arch=('any')
license=("MIT")

pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"

source=("https://github.com/mjg59/python-broadlink/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e0fb1223429d86cab1a9eb7d0ac9514c32f0b8aa67ae4497aef518816d2deed4')

depends=('python-cryptography')
makedepends=('python-setuptools')

build() {
    cd python-broadlink-$pkgver/
    python setup.py build
}

package() {
    cd python-broadlink-$pkgver/
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p "$pkgdir/usr/bin/"
    cp ./cli/broadlink* "$pkgdir/usr/bin/"
}
