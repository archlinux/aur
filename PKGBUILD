# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-statham-schema
_name=${pkgname#python-}
pkgver=0.13.4
pkgrel=1
pkgdesc="Statham is a Python Model Parsing Library for JSON Schema"
arch=(any)
url="https://github.com/jacksmith15/statham-schema"
license=('MIT')
depends=(python python-pyaml python-dateutil python-jsonpointer python-json-ref-dict python-typing_extensions)
source=("https://github.com/jacksmith15/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a23b7efab98c4433df9402118e5766d974b6ec76fcdf817057de538229a8e86')
build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
