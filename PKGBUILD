pkgname=jay-aur
pkgver=7.4.4
pkgrel=1
pkgdesc="A lightweight, semantic AUR helper wrapper for Arch Linux"
arch=('any')
url="https://github.com/xmlzitos154/jay"
license=('MIT')
depends=('bash')
optdepends=(
    'flatpak: hybrid AUR/Flatpak mode'
    'reflector: mirror optimization support'
    'expac: system statistics'
)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd jay
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd jay
    install -Dm755 main.sh "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
    install -Dm644 modules/mod_01.sh "$pkgdir/usr/share/jay/mod_01.sh"
    install -Dm644 modules/mod_02.sh "$pkgdir/usr/share/jay/mod_02.sh"
    install -Dm644 modules/mod_03.sh "$pkgdir/usr/share/jay/mod_03.sh"
    install -Dm644 modules/mod_04.sh "$pkgdir/usr/share/jay/mod_04.sh"
    install -Dm644 modules/mod_05.sh "$pkgdir/usr/share/jay/mod_05.sh"
    install -Dm644 languages/lang_mod_pt.sh "$pkgdir/usr/share/jay/lang_mod_pt.sh"
    install -Dm644 languages/lang_mod_en.sh "$pkgdir/usr/share/jay/lang_mod_en.sh"
}
