# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-selenium-wire
pkgver=4.5.6
pkgrel=1
pkgdesc="Extends Selenium's Python bindings to give you the ability to inspect requests made by the browser"
arch=("any")
url="https://github.com/wkeeling/selenium-wire"
license=("MIT")
depends=("python"
    "python-blinker"
    "python-brotli"
    "python-certifi"
    "python-h2"
    "python-hyperframe"
    "python-kaitaistruct"
    "python-pyasn1"
    "python-pyopenssl"
    "python-pyparsing"
    "python-pysocks"
    "python-selenium"
    "python-wsproto"
    "python-zstandard")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wkeeling/selenium-wire/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("f424b1a8069ac5385fae7ff8abd1d410b5389e6b0faa36cac82dde6d3c0c9ac9")

package() {
    cd "selenium-wire-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
