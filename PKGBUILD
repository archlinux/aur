# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.12
_pkgbase=mate-system-monitor
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="A system monitor for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus-glib' 'glibmm' 'gtkmm' 'libgtop' 'libwnck' 'librsvg')
makedepends=('docbook2x' 'mate-common' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('58fd0ab16ff76a1d0871053698c13cb28f407bf1')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
