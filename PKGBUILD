# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-media
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.0
pkgrel=2
url="http://mate-desktop.org"
pkgdesc="MATE Media Tools (GTK2 version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libcanberra' 'libmatemixer' 'libunique' 'mate-desktop')
makedepends=('intltool')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
sha1sums=('e071d27c13e80b182f10a33d7a190825642d6f75')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgbase} \
        --localstatedir=/var \
        --with-gtk=2.0
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
