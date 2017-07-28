# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.12
_pkgbase=mate-system-monitor
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.2
pkgrel=1
pkgdesc="A system monitor for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus-glib' 'glibmm' 'gtkmm' 'libgtop' 'libwnck' 'librsvg')
makedepends=('docbook2x' 'mate-common' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('aa53f50d8c94135b703fabe64a921e9fdeb61961')

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
