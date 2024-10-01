# Maintainer: Molyuu <mi@molyuu.cyou>
pkgname=ttf-sarasa-gothic-sc
pkgver=1.0.21
pkgrel=1
url=https://github.com/be5invis/Sarasa-Gothic
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (only Sarasa Gothic SC inside)"
arch=(any)
depends=()
license=("OFL")
makedepends=("p7zip")
provides=("ttf-sarasa-gothic-sc")
conflicts=("ttf-sarasa-gothic")
source=(
		"https://mirrors.bfsu.edu.cn/github-release/be5invis/Sarasa-Gothic/LatestRelease/SarasaGothicSC-TTF-$pkgver.7z"
		"LICENSE"
)
sha256sums=('6114880cd828fc4addd9c8e5e2858e664e1f02b4899cdc219611303c2d8169ef'
            '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')

noextract=("SarasaGothicSC-TTF-$pkgver.7z")

prepare() {
    if [ -d "sarasa-$pkgver" ]; then
        rm -rf "sarasa-$pkgver"
    fi      
	mkdir "sarasa-$pkgver"
    cd "sarasa-$pkgver"
    7z x "$srcdir/SarasaGothicSC-TTF-$pkgver.7z"
}

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 $srcdir/sarasa-$pkgver/SarasaGothicSC-*.ttf "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
