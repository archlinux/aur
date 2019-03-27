pkgname=rootbar-hg
pkgver=r98.63ee1eed0bfc
pkgrel=1
pkgdesc="Status bar for the Sway Compositor"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/rootbar"
license=('GPL3')
depends=('wayland' 'gtk3' 'json-c' 'libpulse')
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
        cp ${pkgname}/Release/rootbar "$pkgdir/usr/bin/"
}