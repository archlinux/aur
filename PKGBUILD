# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid-git
pkgver=1.0.r2.2b08472
pkgrel=1
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.7' )
makedepends=(
    git python-setuptools )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname%-git}::git+${url}" )
b2sums=(SKIP)

pkgver(){
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build(){
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package(){
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
