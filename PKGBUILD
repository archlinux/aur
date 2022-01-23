# Maintainer: telans <telans@protonmail.com>
# Co-Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="samrewritten-git"
_pkgname="SamRewritten"
pkgver=r236.3e8d088
pkgrel=1
pkgdesc="A Steam Achievement Manager For Linux."
arch=("any")
url="https://github.com/PaulCombal/SamRewritten"
license=("GPL3")
depends=("steam" "yajl" "gtkmm3" "glibc" "curl")
optdepends=("zenity: error messages with style"
            "valgrind: for automated dev script"
            "massif-visualizer: for automated dev script")
makedepends=("git" "make" "gcc>=9.0")
source=("git+https://github.com/PaulCombal/SamRewritten.git")
sha256sums=("SKIP")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR=${pkgdir} install
}
