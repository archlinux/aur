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
    "${pkgname}::git+${url}#tag=${pkgver}" )
b2sums=(SKIP)

build(){
    cd "${srcdir}/${pkgname}"
    python - build <<<"from setuptools import setup; setup()"
}

package(){
    cd "${srcdir}/${pkgname}"
    python - install --root="${pkgdir}" --optimize=1 --skip-build <<<"from setuptools import setup; setup()"
}
