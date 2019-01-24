# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtk3' 'glib2' 'cinnamon-desktop' 'libpeas')
makedepends=('gnome-common' 'libglade' 'gobject-introspection')
optdepends=('xviewer-plugins: Extra plugins')
provides=($pkgname)
conflicts=('xviewer-git')
url='https://github.com/linuxmint/xviewer'

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('26dd06c2f5ee429c351f8654a9fa466b')

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
