# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-plugins
pkgver=1.0.2
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('xviewer' 'libpeas')
makedepends=('gnome-common')
provides=($_pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3d0190f278a0ce813ebad730218523d9')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/xviewer-plugins"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

