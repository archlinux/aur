# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid
pkgver=0.5
pkgrel=1
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.7' )
makedepends=(
    git )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
b2sums=(
    e98b5eb4ae29726a99a98fed7f7ca0f14b1407977f5058e475ff6168140170d6bc7aadfdd97e6dbe2e1add3aa46758cf393c22e789010c06529437e52255da32 )

build(){
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package(){
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
