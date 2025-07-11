# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.24"
pkgrel="0"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
conflicts=("rimsort-git")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("e2188a97bd939c5bb53735c8ac9bed56045ce7e6c1545b8d24c17abae638c9321f9a941045708bd4b4ee47fdc5c0875857285a2bd27eb220df668515d9ab6eb4"
            "bad323d5fc88b54c426671063acc7e1c806d70ea0091f2763802852938b24e1d574b1dd6d15630aa86884dff4f58227500dc318bd6308291bbbd4b68ac220bb8"
            "bf5de3e5acaab062fd3cbde21997f8219968f53b1d03cb2dca427325554eb687c61e060fd5ea38bed389d4157e85d9ad21c782e373d8ea38d8b34964600dd0d5")

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
