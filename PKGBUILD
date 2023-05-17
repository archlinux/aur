# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="alpha_v1.0.5.4"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/oceancabbage/RimSort"
license=("GPL3")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver//_/-}/RimSort-${pkgver//_/-}_Linux_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("066a3dd4183770344d24e933e513e2ddca2f4b5f2839fc9589d815862b3145fd5403e8a58d907fc579e1f150560fb0635a3755bf7df0f2036ea87de0190d2bc1"
            "99c94e26aedc457bcb4ecfa6f3a3826177cdc93fcedf9826080d23f040d99af7185ea81b9b0144d8c5bbd3b655dfb59eec5c769de5f44088f4ed8f3681e36f96"
            "6d4ffba79de38bc652710d0fb22bc61706b410a70d652362e5da02657a6d7643f8419e66237e5f21e3b6192b97fa46cb0230a660a516584dc5c7b750813653ed")

OPTIONS=(!strip)

package() {
    cd "$srcdir/"
    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r "./RimSort"/* "$pkgdir/opt/rimsort/"
    
    # Icon
    install -Dm644 "$srcdir/RimSort/data/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"
    
    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/launch-script.sh" "$pkgdir/usr/bin/rimsort"
}
