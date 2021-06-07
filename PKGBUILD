# Maintainer: Codepuls <aur@codepuls.de>
# https://aur.archlinux.org/packages/hummingbird-bin/

pkgname=hummingbird-bin
_pkgname=hummingbird
pkgver=1.1.2
pkgrel=4
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
sha512sums=("88392814ac7b3e5ecb4037817c73e514bb6e62588f2fe1d69a2a813b1793aaff0a8baeb4cb16d177920235882ef4831ade8f5390d981f1f1c03a5cc3d9205f67")

package() {
    ldd "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird"
    install -Dm755 "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird" "$pkgdir/usr/bin/$_pkgname"
}

