# Maintainer: Codepuls <aur@codepuls.de>
# https://aur.archlinux.org/packages/hummingbird-bin/

pkgname=hummingbird-bin
_pkgname=hummingbird
pkgver=1.0
pkgrel=1
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
sha512sums=("18f245a1f08e76361dba060b61702b720c73a582112c3a96629255de71d63ce0a81d62029c158bcb878c152eb3e58db5f8c9e544848f4d9da3046a6fe880e97b")

package() {
    ldd "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird"
    install -Dm755 "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird" "$pkgdir/usr/bin/$_pkgname"
}

