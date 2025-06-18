# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.19"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
conflicts=("rimsort-git")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("b59fcaeaba8ef57e8b9ce0a84ad42d74fc4286f8dfb9577c9d7c670ced702a48808c3de2f75f1c74070d9b1538f9934852bae4b29ea4de7b9ec91c57f832725f"
            "43aa5e5d28ec832f3a54434d66e4724c9a8fdde5098b2910911faf62a80823896a9b6d455dbe749150adf11e44126f6851bcd4cd937a3e00bb9b7f95699ca96e"
            "ceca35106c7cde2f826f177892f8ba8848123779255c3c56904467a198e73d255c92fff6d1353d75a4cacfb7af45ed0b7d773fabceec1aaa1ec3e8ad5cc9b3c9")

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
