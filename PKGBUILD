# Maintainer: Codepuls <aur@codepuls.de>
# https://aur.archlinux.org/packages/hummingbird-bin/

pkgname=hummingbird-bin
_pkgname=hummingbird
pkgver=1.0.1
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
sha512sums=("f2cbc2acded6335c996271d9e86818a0375f4f46712b9edb7147494038bff48a1e72f666b319790a8250298e437a87dd8173313156da0497529c0eace3924fea")

package() {
    ldd "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird"
    install -Dm755 "$srcdir/$_pkgname-linux-$arch-$pkgver/hummingbird" "$pkgdir/usr/bin/$_pkgname"
}

