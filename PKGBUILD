pkgname=ttc-sarasa-gothic-lite
pkgver=0.37.4
pkgrel=1
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans.(Exclude light, extralight and semibold.)"
arch=("any")
url="https://github.com/be5invis/Sarasa-Gothic"
license=("OFL")
provides=("ttf-sarasa-gothic")
conflicts=("ttf-sarasa-gothic")
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-ttc-$pkgver.7z" "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha256sums=('d5cde19772923d07d498156762631936e54484f94e68403eb4517b4219a3288a' '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')
noextract=("sarasa-gothic-ttc-$pkgver.7z")

prepare() {
    bsdtar -xf sarasa-gothic-ttc-$pkgver.7z sarasa-{regular,bold,italic,bolditalic}.ttc
}

package() {
    install -d "$pkgdir/usr/share/fonts/sarasa-gothic/"
    install -m644 *.ttc "$pkgdir/usr/share/fonts/sarasa-gothic/"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
