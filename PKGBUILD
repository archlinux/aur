# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.1.3
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('742a907e82fe8fadb49e0eddd517ca18162b068ea5970b6dcd57785f8e132d10')

package() {
    make -C "$srcdir/${pkgname}-v${pkgver}" \
        install \
            DESTDIR="$pkgdir" \
            ROOT_SCRIPT_DIR=/usr/bin \
            USER_SCRIPT_DIR=/usr/bin \
            DISPLAYLINK_SERVICE=displaylink.service
}
