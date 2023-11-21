# Maintainer: DaarkWel <daarkwel at mail dot ru>
_pkgname=pl2g_nx
pkgname=${_pkgname}-git
pkgver=r11.05da7d8
pkgrel=1
pkgdesc="Bash script that convert pacman log file into format readable by gource."
arch=("any")
url="https://codeberg.org/DaarkWel/pl2g_nx"
license=("GPL3")
depends=("bash")
makedepends=("git")
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    install -m755 -D "pl2g_nx.sh" "$pkgdir/usr/bin/pl2g_nx.sh"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL3"
}
