# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
pkgname="pacpak-git"
_pkgname=${pkgname%-git}
pkgver=v0.0.1.r0.gb821dab
pkgrel=1
pkgdesc="manage your flatpaks with this pacman wrapper"
arch=("any")
url="https://github.com/egnrse/pacpak"
license=("MIT")
depends=("flatpak" "bash" "awk" "perl")
makedepends=("git")
optdepends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    cd "${pkgname}"
	install -Dm755 "./pacpak.sh" "${pkgdir}/usr/bin/pacpak"
	#install -Dm644 "./pacpak.1" "${pkgdir}/usr/share/man/man1/pacpak.1"
}
