# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=libmatemixer
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Mixer library for MATE Desktop (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('LGPL')
depends=('alsa-lib' 'libpulse')
makedepends=('mate-common-dev')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('c16d1f7df5fc1267f7e3caadfcc963730b3e5745')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
