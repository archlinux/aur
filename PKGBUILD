# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
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
sha1sums=('a5cea4b9ea3df31732616c0fde2ae5aaad74a445')

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
