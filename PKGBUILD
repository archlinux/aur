# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid
pkgver=1.1
pkgrel=1
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
b2sums=('d4ece43dc546f5cd9c820818b341f4aee4c19f284027738802366f5df42fd61b3980189166498818dfb8c500b51206eb05651d7655e55ced3e64d7c98cec6390')

build(){
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package(){
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
