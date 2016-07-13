# Maintainer:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-common
pkgname="${_pkgbase}-1.15-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Common development macros for MATE"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('autoconf' 'automake' 'gettext' 'gtk-doc' 'intltool' 'libtool'
         'pkg-config')
groups=('mate')
url="http://mate-desktop.org"
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('f9fa3d4758472f79850f864177ed879059f1e34f')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
