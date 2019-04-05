# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.12
_pkgbase=mozo
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.0
pkgrel=3
pkgdesc="MATE menu editing tool (GTK2 version)"
url="http://mate-desktop.org"
arch=('any')
license=('GPL')
depends=('mate-menus-gtk2' 'pygtk' 'python2-gobject')
makedepends=('mate-common')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7538b8e6e72a6ef6a7b146cdb807bc64e1453734')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
