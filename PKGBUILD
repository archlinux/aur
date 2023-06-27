# Maintainer: Jacob Lucas <jtljac2 at gmail dot com>
pkgname="rimsort-bin"
pkgver="alpha_v1.0.5.5"
pkgrel="1"
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/oceancabbage/RimSort"
license=("GPL3")
source=("$pkgname-${pkgver//_/-}.zip::https://github.com/oceancabbage/RimSort/releases/download/${pkgver//_/-}/RimSort-${pkgver//_/-}_Linux_x86_64.zip"
        "RimSort.desktop"
        "launch-script.sh")
sha512sums=("6709bdfe6ca1e54450120b2ba1d60eafdd063a6845cfc2552021542e0317a29f841528d15245197aaefffb33cef9086faffb55b97d7eb512cb1b4648522f22a5"
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
