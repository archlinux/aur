# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-json-ref-dict
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Python dict-like object which abstracts resolution of JSONSchema references"
arch=(any)
url="https://github.com/jacksmith15/json-ref-dict"
license=('MIT')
depends=(python python-jsonpointer)
source=("https://github.com/jacksmith15/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ebd4f6ba724c49abe8d14a61de49e408a48cc5aa5a89e756ee0ef4070ec3a375')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
