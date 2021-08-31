# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid-git
pkgver=0.1.r3.43c968c
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
    "${pkgname%-git}::git+${url}" )
b2sums=(SKIP)

pkgver(){
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package(){
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 wsid -t "${pkgdir}/usr/bin"
}
