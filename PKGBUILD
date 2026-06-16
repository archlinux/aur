# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
_pkgbase=livesplit-one-druid
pkgname=livesplit-one-druid-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A native LiveSplit One frontend built with druid (prebuilt binary)"
arch=('x86_64')
url="https://github.com/AlexKnauth/livesplit-one-druid"
license=('LicenseRef-unknown')
depends=('gtk3')
makedepends=('imagemagick')
provides=("$_pkgbase=$pkgver")
conflicts=("$_pkgbase")
install="$_pkgbase.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexKnauth/livesplit-one-druid/releases/download/$pkgver/livesplit-one-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
    "Icon.ico::https://raw.githubusercontent.com/AlexKnauth/livesplit-one-druid/master/Icon.ico"
    "$_pkgbase.desktop")
sha256sums=('00ef459a90d2073151220fa17ae61e1809918a610a9c370321ae5aef4941ca10'
    '4e4b8302ed9ba8380d519078d23ebafd7a983ccb6bb0d4c3703ff546baec19f8'
    '9fdb62f3876e2b41efbcdcf5920a1c7a0ee5b18ec180854c488a51890f5bd245')

prepare() {
    magick "$srcdir/Icon.ico" "$srcdir/$_pkgbase.png"
}

package() {
    install -Dm755 "$srcdir/LiveSplitOne" "$pkgdir/usr/bin/$_pkgbase"
    install -Dm644 "$srcdir/$_pkgbase.png" "$pkgdir/usr/share/pixmaps/$_pkgbase.png"
    install -Dm644 "$srcdir/$_pkgbase.desktop" "$pkgdir/usr/share/applications/$_pkgbase.desktop"
}
