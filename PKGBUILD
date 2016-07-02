# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-plugins
pkgver=1.0.3
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('xviewer' 'libpeas')
makedepends=('gnome-common')
provides=($_pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2753188a003a21b014fabb326c22d993')

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

