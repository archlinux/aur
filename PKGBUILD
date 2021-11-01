# Maintainer: Dmitry Olyenyov <dmitry.olyenyov@gmail.com>
pkgname=python-broadlink
pkgver=0.18.0
pkgrel=0
arch=('any')
license=("MIT")

pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"

source=("https://github.com/mjg59/python-broadlink/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1512679d6a340148fc21f7f0e5823c10411b050080b11be0b9aa6b7ec55d5798')


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
