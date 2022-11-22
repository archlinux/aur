# Maintainer: Xinc

pkgname=ido
_actual_ver=13.10.0
_extra_ver=+22.10.20221007
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Widgets and other objects used for indicators by the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/ido"
license=(GPL)
depends=(libxi libx11 gobject-introspection pango gdk-pixbuf2 cairo gtk3-ubuntu)
makedepends=(gnome-common pkgconf glibc glib2 vala)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ido_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

build() {
 ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/"${pkgname}" --disable-static --disable-introspection
 make
}

package() {
 make DESTDIR="${pkgdir}" -j1 install
}
