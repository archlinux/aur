# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-backgrounds
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Background images and data for MATE"
url="http://mate-desktop.org"
arch=('any')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
makedepends=('mate-common')
groups=('mate' 'mate-gtk3')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('a7929a9bcd40d14f26e1a33da6bf9d4aceadc15f')

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
