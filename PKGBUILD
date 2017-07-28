# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-terminal
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="The MATE Terminal Emulator (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsm' 'mate-desktop' 'vte')
makedepends=('intltool' 'itstool')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('092bee6c43910c2d038095c268979ea3f6fdd2ef')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-gtk=2.0
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
