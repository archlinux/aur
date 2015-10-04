# Maintainer: Benedikt Heine <benedikt@heine.rocks>
#   - ported to AUR4
# Maintainer: Diogo Leal <estranho@diogoleal.com>
#   - original PKGBUILD

pkgname=afternoonstalker
pkgver=1.1.5
pkgrel=3
pkgdesc="Afternoon Stalker is a clone of the 1981 Intellivision game Night Stalker. "
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/afternoonstalker.html"
license=('GPL')
depends=('flatzebra>=0.1.6')
options=('!libtool' '!emptydirs')
source=(http://perso.b2b2c.ca/sarrazip/dev/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cb9896e00654057edc1ef8843c6c7f5bbcc0b5313e06227ae6e73d0c1d689097')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
