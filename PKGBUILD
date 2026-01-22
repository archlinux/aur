# Maintainer: Adam Ferrick <adameferrick at gmail dot com>

pkgname=kak-crosshairs-git
pkgver=r19.7edba13
pkgrel=1
pkgdesc="Highlight Current Line/Column in Kakoune"
arch=(any)
url="https://github.com/insipx/kak-crosshairs"
license=("Unlicense")
depends=("kakoune")
makedepends=("git")
source=("${pkgname}::git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm 644 ${pkgname}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
    install -Dm 644 ${pkgname}/crosshairs.kak "${pkgdir}"/usr/share/kak/rc/addons/crosshairs.kak
}
