# Contributor: ThanosApostolou <thanosapostolou@outlook.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=zesty
# vercheck-launchpad: name=${pkgname}

pkgname=ido-thanos
_actual_ver=13.10.0
_extra_ver=+17.04.20161028
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Widgets and other objects used for indicators"
arch=(i686 x86_64)
url="https://launchpad.net/ido"
license=(LGPL)
depends=('gtk3')
makedepends=('gnome-common' 'gobject-introspection' 'gtk-doc' 'vala' 'xorg-util-macros')
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ido_${_actual_ver}${_extra_ver}.orig.tar.gz")
md5sums=('f666eda0d011305b163f9a73b553c205')

build() {
    
    ./autogen.sh --prefix=/usr --disable-static --disable-introspection
    make
}

package() {
    
    make DESTDIR="${pkgdir}/" install
}
