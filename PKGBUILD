# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="v1.0.21"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
conflicts=("rimsort-git")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver}/RimSort-${pkgver}-Ubuntu-24.04_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("47edc5c0f69806b1058d38383284c366833b8d64fd81eca489db787f8ef3006257b08c4f1f4d427de87e9d72124f1689d99b1b5e1774c2b859467c52e5dcf6d8"
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
