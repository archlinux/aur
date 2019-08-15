# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfdesktop
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.5
pkgrel=1
pkgdesc="A desktop manager for Xfce (GTK2 version)"
arch=('x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4ui-gtk2' 'thunar-gtk2' 'garcon' 'hicolor-icon-theme' 'libwnck')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('3f2426ac28b94cfe5d6fd187c59b4e78f40e66c2842318e158ecd82abe2e7c0a')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-gio-unix \
        --enable-thunarx \
        --enable-notifications \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
