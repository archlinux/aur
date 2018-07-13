# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Stefano Capitani <stefano at manjaro dot org>
#
pkgname="mate-indicator-applet"
pkgver=1.20.1
pkgrel=1
pkgdesc="Applet to display information from various applications consistently in the MATE panel."
url="https://github.com/mate-desktop/${pkgname}"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('intltool' 'mate-common')
depends=('mate-panel' 'libappindicator-gtk3' 'ido')
optdepends=('indicator-sound')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('04ed972edfb049772df25bcca1d7ef1bd829932f16f9fbcf1b81630cce3f240a')

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

# vim: set ts=4 sw=4 et syn=sh ft=sh:
