# Maintainer: Codepuls <aur@codepuls.de>
# https://aur.archlinux.org/packages/hummingbird-bin/

pkgname=hummingbird-bin
_pkgname=hummingbird
pkgver=1.0.2
pkgrel=2
epoch=1
pkgdesc="AirVPN's free and open source OpenVPN 3 client based on AirVPN's OpenVPN 3 library fork"
arch=('x86_64')
url="https://gitlab.com/AirVPN/hummingbird"
license=("GNU GPLv3")
depends=()
optdepends=("otool")
provides=("${pkgname%-bin}" "hummingbird")
conflicts=("${pkgname%-bin}" "hummingbird")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/AirVPN/hummingbird/raw/master/binary/hummingbird-linux-x86_64-${pkgver}.tar.gz")
sha512sums=("b6c986277c69242ecf23beff1bb6c3d514922520ba33f074fad11a13e6b6b2a228713d67c21e775c5bfe15b47523423513c78fe8c845b13e68791d5781eb3f4c")

package() {
    ldd "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird"
    install -Dm755 "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird" "$pkgdir/usr/bin/$_pkgname"
}

