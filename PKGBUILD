# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer
pkgver=2.6.2
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtk3' 'glib2' 'cinnamon-desktop' 'libpeas' 'libexif')
makedepends=('gnome-common' 'libglade' 'gobject-introspection')
optdepends=('xviewer-plugins: Extra plugins')
provides=($pkgname)
conflicts=('xviewer-git')
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3d3fec2d7ba87cf4bdb98c5fdec22058')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
