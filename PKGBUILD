# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.7"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/oceancabbage/RimSort"
license=("GPL3")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("8b05c4d93b5bec05203b428abafbc53035f5e010f18c89e579a7c1a10af303aee16762afe28bd10ecd267fe892765137a94b53d243775f5e5da10d9c60d80876"
            "43aa5e5d28ec832f3a54434d66e4724c9a8fdde5098b2910911faf62a80823896a9b6d455dbe749150adf11e44126f6851bcd4cd937a3e00bb9b7f95699ca96e"
            "b737900aa332b202ae7cf48bd2f345b8e2af7fecaf0bd606768d26d8c632843b325f173f9c39879ef8ff0e1dafebd0bbdcb28d4be6d35c3532fba807b0ac86fd")

OPTIONS=(!strip)

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
