# Maintainer: Xinc

pkgname=gsettings-ubuntu-touch-schemas
_actual_ver=0.0.7
_extra_ver=+21.10.20210712
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="GSettings desktop-wide schemas for the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/gsettings-ubuntu-touch-schemas"
license=(GPL)
depends=(accountsservice dconf)
makedepends=(gnome-common glib2 make)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-ubuntu-touch-schemas_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

build() {
 ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/"${pkgname}" --localstatedir="/var" --disable-static
 make
}

package() {
 make DESTDIR="${pkgdir}" install
}
