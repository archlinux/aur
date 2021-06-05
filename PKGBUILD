# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.2
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('cba3e675269179330b286914801f5be24751fb87852f9c1e9959766401904a64')

package() {
    make -C "$srcdir/${pkgname}-v${pkgver}" \
        install \
            DESTDIR="$pkgdir" \
            ROOT_SCRIPT_DIR=/usr/bin \
            USER_SCRIPT_DIR=/usr/bin \
            DISPLAYLINK_SERVICE=displaylink.service
}
