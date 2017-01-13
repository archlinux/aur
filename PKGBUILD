# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=mate-backgrounds
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="Background images and data for MATE"
url="http://mate-desktop.org"
arch=('any')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
makedepends=('mate-common-dev')
groups=('mate' 'mate-gtk3')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('6fd1f772b80da65105abe2267ea9f6fd7851434b')

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
