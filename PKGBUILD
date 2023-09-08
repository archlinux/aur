#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=dfcp-git
pkgver=r11.05e73c1
arch=("x86_64")
pkgrel=1
pkgdesc="A script to manage dotfiles"
license=("MIT")
makedepends=("git")
url="https://github.com/LevitatingBusinessMan/dotfiles"
source=("$pkgname::git+https://github.com/LevitatingBusinessMan/dotfiles.git")
sha256sums=("SKIP")
provides=("dfcp")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
 	cd "${srcdir}/${pkgname}"
 	install -Dvm 755 dfcp "${pkgdir}/usr/bin/dfcp"
}
