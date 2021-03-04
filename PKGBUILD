# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-translate
pkgver=3.5.0
pkgrel=1
pkgdesc="Translate is a simple but powerful translation tool written in python with with support for multiple translation providers."
url="https://github.com/terryyin/translate-python"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=(${pkgname}::"https://github.com/terryyin/translate-python/archive/$pkgver.tar.gz")
sha256sums=('fb3bd2153d02861607c946a0d24141e6f7d7f111deadd3dc42f0737778423224')

build() {
    cd "${srcdir}/translate-python-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/translate-python-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
