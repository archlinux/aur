# Maintainer: toluschr at protonmail dot com

pkgname="yaru-colors-gtk-theme-git"
pkgver="cbc4598"
pkgrel="1"
pkgdesc="A fork of Ubuntu's Yaru theme - in different colors "
arch=("x86_64")
license=("MIT")
url="https://github.com/Jannomag/Yaru-Colors"
makedepends=("git")
provides=("adwaita-creamy")

source=("git+https://github.com/Jannomag/Yaru-Colors.git")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/share/themes"
    cd "$srcdir/Yaru-Colors/Themes"
    mv "Yaru-MATE -dark" "Yaru-MATE-dark"

    for themeVariant in $(ls)
    do
        echo "Installing -> $themeVariant"
        cp -rL "$srcdir/Yaru-Colors/Themes/$themeVariant" "$pkgdir/usr/share/themes/"
    done
}