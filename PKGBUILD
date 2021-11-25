pkgname=terrafirma-git
pkgver=r263.0cc8162
pkgrel=1
pkgdesc="Mapping for Terraria"
arch=('x86_64')
conflicts=('terrafirma')
url="https://github.com/mrkite/TerraFirma"
license=('BSD')
makedepends=('git')
source=("$pkgname::git+https://github.com/mrkite/TerraFirma.git")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
  cd "$srcdir/$pkgname"
  qmake
  make
  mkdir -p "$pkgdir/usr/bin"
  install terrafirma "$pkgdir/usr/bin"
}
