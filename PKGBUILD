# Maintainer: Dmitry Olyenyov <dmitry.olyenyov@gmail.com>
pkgname=python-broadlink
pkgver=0.18.2
pkgrel=0
arch=('any')
license=("MIT")

pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"

source=("https://github.com/mjg59/python-broadlink/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6b11e6173a57e32982a44ca214b71bfcdd725b1081e9bc0a5f9fb63dab4b4f9e')


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
