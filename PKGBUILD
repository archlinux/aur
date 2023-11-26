# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=7.1.0
pkgrel=1
pkgdesc="World of Warcraft addon manager. F/OSS, ad-free and privacy respecting."
arch=("x86_64")
url="https://github.com/ogri-la/strongbox"
license=("AGPL")
depends=("zlib")
options=(!strip)
provides=("$pkgname")
changelog="changelog"
conflicts=("$pkgname")
replaces=("wowman")
noextract=("$pkgname-$pkgver")

# "strongbox-1.2.3::https://github.com/ogri-la/strongbox/releases/download/1.2.3/strongbox"
source=(
    "$pkgname-$pkgver::https://github.com/ogri-la/strongbox/releases/download/$pkgver/$pkgname"
    "$pkgname.desktop"
)

strongbox_sha256="54bbf2bb841c124a1768e6db10a2984838799c2f21f284ad0a0e6ac09c082083"
strongbox_desktop_sha256="b021ee257f90c04e05e8819774956fe51a7312f126884d9a71b12e067df48aa4"
sha256sums=(
    "$strongbox_sha256"
    "$strongbox_desktop_sha256"
)

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
