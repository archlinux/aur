# Maintainer: haha662 <haha662 at outlook dot com>

pkgname=arch-texdoc-git
pkgver=r3.5fe70bf
pkgrel=1
pkgdesc="Drop-in replacement of texdoc for Arch Linux using online documents"
arch=("any")
url="https://github.com/haha662/arch-texdoc"
license=("MIT")
depends=("python" "xdg-utils")
makedepends=("git")
source=("$pkgname::git+https://github.com/haha662/arch-texdoc.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -Dm755 arch-texdoc.py "${pkgdir}/usr/bin/arch-texdoc"
}
