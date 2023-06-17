# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="greenpass"
pkgver=4.3.1
pkgrel=1
pkgdesc="Scriptable green pass / Digital Covid Certificate verifier"
url="https://github.com/berdav/greenpass"
license=("LGPL3")
arch=("any")
depends=("python-base45"
         "python-bs4"
         "python-cbor2"
         "python-colorama"
         "python-pycose"
         "python-pillow"
         "python-pyasn1"
         "python-pymupdf"
         "python-pyopenssl"
         "python-pytz"
         "python-requests"
         "python-termcolor"
         "python-tzlocal"
         "pyzbar"
        )
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d8d6c47e57459b8f549661446ee33d554b74ac4ea8bc594089fa916a596d9e3')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
