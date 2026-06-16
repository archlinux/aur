# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=livesplit-one-druid
pkgver=0.7.2
pkgrel=2
pkgdesc="A native LiveSplit One frontend built with druid (prebuilt binary)"
arch=('x86_64')
url="https://github.com/AlexKnauth/livesplit-one-druid"
license=('LicenseRef-unknown')
depends=('gtk3')
makedepends=('imagemagick')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexKnauth/livesplit-one-druid/releases/download/$pkgver/livesplit-one-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
    "Icon.ico::https://raw.githubusercontent.com/AlexKnauth/livesplit-one-druid/master/Icon.ico"
    "$pkgname.desktop")
sha256sums=('00ef459a90d2073151220fa17ae61e1809918a610a9c370321ae5aef4941ca10'
    '4e4b8302ed9ba8380d519078d23ebafd7a983ccb6bb0d4c3703ff546baec19f8'
    'SKIP')

prepare() {
    magick "$srcdir/Icon.ico" "$srcdir/$pkgname.png"
}

package() {
    install -Dm755 "$srcdir/LiveSplitOne" "$pkgdir/usr/bin/livesplit-one-druid"
    install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
