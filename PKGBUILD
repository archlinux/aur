# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-lazr-uri PKGBUILD by ValHue <vhuelamo at gmail dot com>

_pkgname="lazr.uri"
pkgname=("python-lazr-uri")
pkgver="1.0.4"
pkgrel="1"
pkgdesc="A self-contained, easily reusable library for parsing, manipulating, and generating URIs."
arch=('any')
url="https://launchpad.net/$_pkgname"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz")
sha256sums=('02838f2328e87e1093528d62ffbd9b540f7f3a2b9d42c7439a29c20db2f831bf')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
