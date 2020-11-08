# Maintainer: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-asn1tools
pkgver=0.155.3
pkgrel=1
pkgdesc='A Python package for ASN.1 parsing, encoding and decoding'
arch=(any)
url='https://github.com/eerimoq/asn1tools.git'
license=('MIT')
depends=(
    python 
    licenses
    python-prompt_toolkit
    python-diskcache
)
makedepends=(python-pip)
checkdepends=(python-pytest python-trio)
source=(asn1tools-$pkgver.tar.gz::https://github.com/eerimoq/asn1tools/archive/$pkgver.tar.gz)
md5sums=(e1538bd40946ef3045e1766f6142729e)
sha1sums=(c442cbdb7df189d36523eb408f138910dc66ea64)

build() {
    cd asn1tools-$pkgver
    python setup.py build
}

package() {
    cd asn1tools-$pkgver
    python setup.py install -O1 --root="$pkgdir" --skip-build
}
