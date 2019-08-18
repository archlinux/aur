pkgname=wofi-hg
pkgver=r0.212598d693a9
pkgrel=1
pkgdesc="Rofi-like wlroots launcher"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/wofi"
license=('GPL3')
depends=('wayland' 'gtk3')
makedepends=('mercurial')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
pkgver() {
        cd "$pkgname"
        printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
build() {
        cd "${pkgname}/Release"
        make
}
package() {
        mkdir -p "$pkgdir/usr/bin"
        cp ${pkgname}/Release/wofi "$pkgdir/usr/bin/"
}