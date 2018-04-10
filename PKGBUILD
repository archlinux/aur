# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Stefano Capitani <stefano at manjaro dot org>
#
pkgname="mate-indicator-applet"
pkgver=1.20.0
pkgrel=2
pkgdesc="Applet to display information from various applications consistently in the MATE panel."
url="https://github.com/mate-desktop/$pkgname"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('intltool' 'mate-common')
depends=('mate-panel' 'libappindicator-gtk3' 'ido')
optdepends=('indicator-sound')
source=("${pkgname}-${pkgver}::https://github.com/mate-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7b9b0ed9b4044ce47fc2ea3f3f7848295da1bf18b9405f8f609555f678a0b3e6')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=2 ft=sh et
