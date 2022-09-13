pkgname=ttc-sarasa-gothic-lite
pkgver=0.37.1
pkgrel=3
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans.(Exclude light, extralight and semibold.)"
arch=("any")
url="https://github.com/be5invis/Sarasa-Gothic"
license=("OFL")
provides=("ttf-sarasa-gothic")
conflicts=("ttf-sarasa-gothic")
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-ttc-$pkgver.7z" "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha256sums=('c84e1493169e4ec92da9430dbf8b741f17564a233892e245cbc3d50fdc9c91f5' '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')
noextract=("sarasa-gothic-ttc-$pkgver.7z")

prepare() {
    bsdtar -xf sarasa-gothic-ttc-$pkgver.7z sarasa-{regular,bold,italic,bolditalic}.ttc
}

package() {
    install -d "$pkgdir/usr/share/fonts/sarasa-gothic/"
    install -m644 *.ttc "$pkgdir/usr/share/fonts/sarasa-gothic/"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
