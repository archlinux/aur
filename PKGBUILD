# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="greenpass"
pkgver=4.2.2
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
makedepends=("python-setuptools")
optdepends=("antigen: 24h base green pass"
            "covid: 6m super green pass"
            "vaccine-git: 6m super green pass"
           )
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cdd7e2a54ed2cd952fec2aa5eaa9ff83c7c0802ac7fe7f5f1f866196ae63928c')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
