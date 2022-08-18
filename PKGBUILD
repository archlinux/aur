# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.3.0
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('any')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('263ad00567a2da87a155df812ba9f55a7c63a04344f3df3744bf14bb52e1e45c')

package() {
    make -C "$srcdir/${pkgname}-v${pkgver}" \
        install \
            DESTDIR="$pkgdir" \
            ROOT_SCRIPT_DIR=/usr/bin \
            USER_SCRIPT_DIR=/usr/bin \
            DISPLAYLINK_SERVICE=displaylink.service
}
