# Maintainer: Tokyob0t <kparra2023[at]alu.uct.cl>

_pkgname=pixie-icon-theme
pkgname="$_pkgname-git"
pkgver=0.0.1.r26.g8780854
pkgrel=1
pkgdesc='Pixie icon theme (git development version)'
arch=('any')
url="https://github.com/maxtron95/$_pkgname"
license=('CC-BY-SA-4.0')
source=("git+https://github.com/maxtron95/pixie-icon-theme.git")
sha256sums=('SKIP')
makedepends=('git')
depends=()
optdepends=()
conflicts=("$_pkgname")
options=()

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "0.0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    install -dm755 "$pkgdir/usr/share/icons/Pixie"
    cp -r Pixie/* "$pkgdir/usr/share/icons/Pixie/"

    install -dm755 "$pkgdir/usr/share/icons/Pixie Templates"
    cp -r "Pixie Templates"/* "$pkgdir/usr/share/icons/Pixie Templates/"

    install -Dm644 pixie-preview.png "$pkgdir/usr/share/pixmaps/pixie-preview.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
