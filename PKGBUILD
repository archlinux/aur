# $Id: PKGBUILD 175219 2016-05-13 18:43:12Z arojas $
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=clipit
pkgver=1.4.2
pkgrel=6
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64')
url="http://gtkclipit.sourceforge.net/"
license=('GPL3')
depends=('gtk2' 'librsvg')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("https://github.com/downloads/shantzu/ClipIt/${pkgname}-${pkgver}.tar.gz")
md5sums=('118175f26869adcf04909fdbb5021eff')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
