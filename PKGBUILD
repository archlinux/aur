# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=7.0.0
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

strongbox_sha256="43f9987eb293277cf1912976a27a96b2b44636dc7528cdc012c38ce2193330cd"
strongbox_desktop_sha256="b021ee257f90c04e05e8819774956fe51a7312f126884d9a71b12e067df48aa4"
sha256sums=(
    "$strongbox_sha256"
    "$strongbox_desktop_sha256"
)

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
