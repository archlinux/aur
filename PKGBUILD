# Maintainer: Molyuu <mi@molyuu.cyou>
pkgname=ttf-sarasa-gothic-sc
pkgver=1.0.28
pkgrel=1
url=https://github.com/be5invis/Sarasa-Gothic
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (only Sarasa Gothic SC inside)"
arch=(any)
depends=()
license=("OFL")
makedepends=("p7zip")
provides=("ttf-sarasa-gothic-sc")
conflicts=("ttf-sarasa-gothic")
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/SarasaGothicSC-TTF-$pkgver.7z"
		"LICENSE"
)
sha256sums=('54347cb66c58604a063b729a68a5d8875a85b311a0b1af66c9f41a13534289e9'
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
