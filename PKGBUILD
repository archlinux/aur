# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=3.20
_pkgbase=mate-themes
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.10
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
sha1sums=('d44f484987c269820662a037f763c248a5d24356')

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
