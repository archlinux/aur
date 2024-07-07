# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.8"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/oceancabbage/RimSort"
license=("GPL3")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("d0bd57c47f095c75e02c3113ba1535f2f7604bc39204fa24c865e0f72873ff1ab3834618047228946462be5968f2c06cd81926be4e884c2b4320e1a46316c8ca"
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
