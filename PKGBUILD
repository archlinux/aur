# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-common
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.3
pkgrel=5
pkgdesc="Common development macros for MATE (GTK3 version)"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('autoconf' 'automake' 'gettext' 'gtk-doc' 'intltool' 'libtool'
         'pkg-config')
groups=('mate')
url="http://mate-desktop.org"
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('8f838e7873e1ad2892d87a8a8506f81518dfd0b2')

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
