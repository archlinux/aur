# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-hologram
pkgver=0.0.16
pkgrel=1
pkgdesc="JSON schema generation from dataclasses"
arch=('any')
url="https://github.com/dbt-labs/hologram"
license=('MIT')
makedepends=("python" "python-pytest")
depends=("python" "python-dateutil" "python-jsonschema")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$_name/archive/v$pkgver.tar.gz")
md5sums=('58420586cfd00ce2d8239c615324e484')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

