# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=aurafetch
pkgname=${_pkgname}-git
pkgver=r40.7ad1275
pkgrel=1
pkgdesc="A super-minimal info script written in bash"
arch=("any")

url="https://gitlab.com/LionessAlana/aurafetch"
license=("GPL3")

depends=("xorg-xprop" "grep" "awk")
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
