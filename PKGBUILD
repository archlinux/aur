pkgname=cly
pkgver=7.5.3
pkgrel=1
pkgdesc="A semantic AUR helper wrapper for Arch Linux written in bash"
arch=('any')
url="https://github.com/xmlzitos154/cly"
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
    cd cly
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd cly
    install -Dm755 main.sh "$pkgdir/usr/bin/cly"
    install -Dm644 README.md "$pkgdir/usr/share/doc/cly/README.md"
    install -Dm644 modules/mod_01.sh "$pkgdir/usr/share/cly/mod_01.sh"
    install -Dm644 modules/mod_02.sh "$pkgdir/usr/share/cly/mod_02.sh"
    install -Dm644 modules/mod_03.sh "$pkgdir/usr/share/cly/mod_03.sh"
    install -Dm644 modules/mod_04.sh "$pkgdir/usr/share/cly/mod_04.sh"
    install -Dm644 modules/mod_05.sh "$pkgdir/usr/share/cly/mod_05.sh"
    install -Dm644 languages/lang_mod_pt.sh "$pkgdir/usr/share/cly/languages/lang_mod_pt.sh"
    install -Dm644 languages/lang_mod_en.sh "$pkgdir/usr/share/cly/languages/lang_mod_en.sh"
}
