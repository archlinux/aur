# Maintainer: Leonid Tsybulsky <axonyx mail dot ru>

pkgname="lenovo-legion-electric-ray-git"
_pkgname="electric-ray"
pkgver=r32.c10ac91
pkgrel=1
pkgdesc="Lenovo Legion 'Rapid charge' & 'Conservation'."
arch=("x86_64")
url="https://github.com/CuriousGecko/electric-ray"
license=("GPL")
depends=("python" "pyside6" "acpi")
conflicts=("electric-ray")
source=("git+https://github.com/CuriousGecko/electric-ray.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm644 "$HOME/.config/electric-ray"
    install -Dm644 main.py "$pkgdir/usr/share/$_pkgname/main.py"
    install -Dm644 constants.py "$pkgdir/usr/share/$_pkgname/constants.py"
    install -Dm644 images.py "$pkgdir/usr/share/$_pkgname/images.py"
    install -Dm644 ui_main.py "$pkgdir/usr/share/$_pkgname/ui_main.py"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/electric-ray"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "images/icons/electric_ray_warning.png" \
                   "$pkgdir/usr/share/$_pkgname/images/icons/electric_ray_warning.png"
    install -Dm644 "images/icons/electric_ray.png" \
                   "$pkgdir/usr/share/$_pkgname/images/icons/electric_ray.png"
}
