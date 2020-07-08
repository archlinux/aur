# Maintainer: Codepuls <aur@codepuls.de>
# https://aur.archlinux.org/packages/hummingbird-bin/

pkgname=hummingbird-bin
_pkgname=hummingbird
pkgver=1.1.0
pkgrel=3
epoch=1
pkgdesc="AirVPN's free and open source OpenVPN 3 client based on AirVPN's OpenVPN 3 library fork"
arch=('x86_64')
url="https://gitlab.com/AirVPN/hummingbird"
license=("GNU GPLv3")
depends=("gcc-libs")
optdepends=("otool")
provides=("${pkgname%-bin}" "hummingbird")
conflicts=("${pkgname%-bin}" "hummingbird")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/AirVPN/hummingbird/raw/master/binary/hummingbird-linux-x86_64-${pkgver}.tar.gz")
sha512sums=("6fe5df66e75fe7d7b52848f888d5905e5279167440c5d62ec7d816b911210725cda08c63337a96b3b4f79333114cdc0a18015702f30920dfe364070ac549886e")

package() {
    ldd "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird"
    install -Dm755 "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird" "$pkgdir/usr/bin/$_pkgname"
}

