# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=3.20
_pkgbase=mate-themes
pkgname="${_pkgbase}-3.20-gtk3"
pkgver=${_ver}.11
pkgrel=1
pkgdesc="Default themes for the MATE desktop"
url="http://mate-desktop.org"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine' 'gtk-update-icon-cache'
         'librsvg' 'mate-icon-theme-dev')
makedepends=('mate-common-dev' 'icon-naming-utils')
groups=('mate' 'mate-gtk3')
source=("http://pub.mate-desktop.org/releases/themes/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('232d935685952fb9324410f0913221cc7e19ee11')

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
