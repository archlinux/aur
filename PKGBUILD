# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid
pkgver=0.3
pkgrel=1
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.9' )
makedepends=(
    git )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
b2sums=(
    ac11eb4e81b96b85b2fcc9d859edaf8f7165ffed02f87e817193db328968136df3357170be2c3bc8d5ef60248eb7c12a6753b9d498b1026aeb3360d1329f4db1 )

build(){
    cd "${srcdir}/${pkgname}"
    python - build <<<"from setuptools import setup; setup()"
}

package(){
    cd "${srcdir}/${pkgname}"
    python - install --root="${pkgdir}" --optimize=1 --skip-build <<<"from setuptools import setup; setup()"
}
