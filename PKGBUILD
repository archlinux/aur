# Maintainer: Cihan Alkan <cihanalk@gmail.com>

pkgname=ukui-desktop
pkgver=1.1.6
pkgrel=1
pkgdesc="UKUI Masaüstü"
url="https://ukui-desktop.org"
arch=('x86_64')
license=('GPL')
depends=('gtk3' 'ukwm' 'startup-notification')
makedepends=('gobject-introspection' 'intltool')
optdepends=()
groups=('ukui')
source=("git+https://github.com/ukui/ukui-desktop.git")
sha256sums=('SKIP')

prepare() {
 cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${pkgname}
    ./configure \
        --prefix=/usr \
        --disable-schemas-compile

    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
