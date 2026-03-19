# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.76"
pkgrel="0"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
conflicts=("rimsort-git")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("7e4b7ba881e77c9ab77ee5aab7b1e4b7373a891fce2c2035b5f2329ac6de3740ff6485cdec2a51ca0bb0d09a0b0fec4001fd6b5c4c35151d65d0aecb17cf39f6"
            "932b82a175c789723fcb5defe4a7c058d6a941938e80252d4d24a6615527376af4becc5d0b2106be02794ceda3e278d020076bf4c2882c3eebaf853512f2028d"
            "aa21235357b7512817ca2d24fc79040adc7c2742a8c5c38eeef64531e479d575a9d41183eba05e636a2d2cddcf4cda112b5b6b2c1c1f5e6350cea924416df59e")

options=(!strip)

package() {
    cd "$srcdir/"
    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r "./RimSort"/* "$pkgdir/opt/rimsort/"
    
    # Icon
    install -Dm644 "$srcdir/RimSort/themes/default-icons/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"
    
    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/launch-script.sh" "$pkgdir/usr/bin/rimsort"
}
