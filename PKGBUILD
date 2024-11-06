# Maintainer: Dmitry Olyenyov <dmitry.olyenyov@gmail.com>
pkgname=python-broadlink
pkgver=0.19.0
pkgrel=1
arch=('any')
license=("MIT")

pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"

source=("https://github.com/mjg59/python-broadlink/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5a069e18fa3491d5a467cea74a28182635628be12788811f59fbc604c08ee9b0')

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
