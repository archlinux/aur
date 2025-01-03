# Maintainer: Sahaj Bhatt  <https://github.com/sahaj-b>

pkgname=wayvibes-git
_pkgname=wayvibes
pkgver=r38.82ed31c
pkgrel=1
pkgdesc="Play mechanical keyboard sounds as you type - wayland alternative for mechvibes/rustyvibes"
arch=("x86_64")
url="https://github.com/sahaj-b/wayvibes"
depends=("nlohmann-json" "libevdev")
makedepends=("git" "make")
install=notes.install
options=('!strip')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/$_pkgname"
    make
}

package() {
    cd "${srcdir}/$_pkgname"
    install -Dm755 "$_pkgname" -t ${pkgdir}/usr/bin/
}
