# Maintainer: Molyuu <mi@molyuu.cyou>
pkgname=ttf-sarasa-gothic-sc
pkgver=1.0.7
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
		"https://mirrors.bfsu.edu.cn/github-release/be5invis/Sarasa-Gothic/LatestRelease/Sarasa-TTF-$pkgver.7z"
		"LICENSE"
)

sha256sums=('b9019e755d2427f6319e96c973be6dbaccbd9af72ec40da7a3c30af1076aa71a'
            '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')

noextract=("Sarasa-TTF-$pkgver.7z")

prepare() {
    if [ -d "sarasa-$pkgver" ]; then
        rm -rf "sarasa-$pkgver"
    fi
	mkdir "sarasa-$pkgver"
    cd "sarasa-$pkgver"
    7z x "$srcdir/Sarasa-TTF-$pkgver.7z"
}

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 $srcdir/sarasa-$pkgver/SarasaGothicSC-*.ttf "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
