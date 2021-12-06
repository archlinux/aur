# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-plugins
pkgver=1.4.1
pkgrel=3
pkgdesc="Plugins for xviewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xviewer' 'libpeas')
makedepends=('gnome-common' 'gobject-introspection')
provides=($pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('be81aab5f798ba018f747e3be1dbd8d7')

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
