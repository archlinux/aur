# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.2.1
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('any')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('3d2f3dd13d698e451cd283174f62689280bd2a5bb749c5c7ab81b94fb278052c')

package() {
    make -C "$srcdir/${pkgname}-v${pkgver}" \
        install \
            DESTDIR="$pkgdir" \
            ROOT_SCRIPT_DIR=/usr/bin \
            USER_SCRIPT_DIR=/usr/bin \
            DISPLAYLINK_SERVICE=displaylink.service
}
