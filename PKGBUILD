# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid
pkgver=1.0
pkgrel=2
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.7' )
makedepends=(
    python-setuptools )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
b2sums=('98f2dfea2e9e98493c336c9fc0e8b5d027617090021c4074f44ebd68e7fc5be9f4df1fe148f63efc1f730228e24d7586c3d92a2cef6645ad24861b0a9c06a49f')

build(){
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package(){
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
