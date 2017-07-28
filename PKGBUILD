# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-power-manager
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.2
pkgrel=2
pkgdesc="Power management tool for the MATE desktop (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'libcanberra' 'libgnome-keyring' 'libnotify' 'libunique' 'upower')
makedepends=('intltool' 'itstool' 'mate-panel-gtk2')
optdepends=('mate-panel: Set brightness and inhibit power 
management from the panel')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
sha1sums=('d688f8903216819ccd6c6000aea6d6a847706a52')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --with-gtk=2.0 \
        --disable-strict
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
