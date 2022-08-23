# Maintainer: Aidan Neal <decator(dot)c(at)proton(dot)me>
pkgname="qinfo-git"
_pkgname="qinfo"
pkgver=r70.rb3f292d.
pkgrel=1
pkgdesc="A system info program. Fetches system info and displays it."
arch=("x86_64")
url="https://github.com/El-Wumbus/qinfo"
license=("LGPL3")
provides=("qinfo")
makedepends=("gcc" "make" "git")
depends=("coreutils")
optdepends=("snapd: List number of snap packages"
            "flatpak: List number of flatpak packages")
source=($_pkgname::"git+https://github.com/El-Wumbus/qinfo.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.$s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
}