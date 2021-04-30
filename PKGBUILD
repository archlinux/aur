# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.1.4
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('a6100be6c7196368cab39b1ea9ec5732e783fa05134aefc4e139dee0cc9df09a')

package() {
    make -C "$srcdir/${pkgname}-v${pkgver}" \
        install \
            DESTDIR="$pkgdir" \
            ROOT_SCRIPT_DIR=/usr/bin \
            USER_SCRIPT_DIR=/usr/bin \
            DISPLAYLINK_SERVICE=displaylink.service
}
