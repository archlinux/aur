# Maintainer: Dmitry Olyenyov <dmitry.olyenyov@gmail.com>
pkgname=python-broadlink
pkgver=0.17.0
pkgrel=0
arch=('any')
license=("MIT")

pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"

source=("https://github.com/mjg59/python-broadlink/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5cd733da2a922456477d461b7da6315bf6fe7fa7fa96dfeaac3aa1255c6be9b1')


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
