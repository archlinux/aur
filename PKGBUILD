# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-selenium-wire
pkgver=5.1.0
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
sha256sums=("a9de7ab7bf6cba6bf582caedce6fabb5aea95348635ba060e3296009130c66b4")

package() {
    cd "selenium-wire-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
