# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=aurafetch
pkgname=${_pkgname}-git
pkgver=r26.937b9e1
pkgrel=1
pkgdesc="An easily editable, super-minimal info script written in bash"
arch=("any")

url="https://gitlab.com/LionessAlana/aurafetch"
license=("GPL3")

depends=("bash" "pacman" "xorg-xprop")
makedepends=("git")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}::git+https://gitlab.com/LionessAlana/${_pkgname}.git"
)
sha512sums=(
    "SKIP"
)
pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    install -m755 -D "aura" "$pkgdir/usr/bin/aura"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
