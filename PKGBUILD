# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=arch-deployer-git
_pkgname=arch-deployer
gitname=Arch-Deployer
pkgver=r11.3eaa86a
pkgrel=1
pkgdesc='A script to bulk download an Arch Linux package with all its dependencies'
arch=(x86_64 aarch64)
url="https://github.com/ivan-hc/$gitname"
license=(GPL3)
depends=(exo)
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -m0644 -D "$srcdir/$gitname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
