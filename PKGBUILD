# Maintainer: KaptenSea <andreas@swetux.se>
pkgname=bookstory-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Native desktop client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/kaptensea/bookstory"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('bookstory')
conflicts=('bookstory')
source=("bookstory_${pkgver}_amd64.deb::https://github.com/kaptensea/bookstory/releases/download/v${pkgver}/bookstory_${pkgver}_amd64.deb")
sha256sums=('53be805815a1a460cda03bbaf1cb6169ae7d82111a811c09b1a5f81dba58d2d5')

prepare() {
    cd "$srcdir"
    ar x "bookstory_${pkgver}_amd64.deb"
    tar xf data.tar.gz
}

package() {
    cd "$srcdir"

    install -Dm755 usr/bin/bookstory \
        "$pkgdir/usr/bin/bookstory"

    install -Dm644 usr/share/applications/bookstory.desktop \
        "$pkgdir/usr/share/applications/bookstory.desktop"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/bookstory.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/bookstory.png"

    install -Dm644 usr/share/icons/hicolor/128x128/apps/bookstory.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/bookstory.png"

    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/bookstory.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/bookstory.png"
}
