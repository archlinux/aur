# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xapps
pkgver=1.0.2
pkgrel=1
pkgdesc="Common library for X-Apps project"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgnomekbd')
makedepends=('')
provides=($_pkgname)
conflicts=('xapps-git')
url='https://github.com/linuxmint/xapps'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7d6aed5ca7c015ca0ad5c50e24633bd5')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

