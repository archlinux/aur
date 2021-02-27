# Maintainer: Lubosz Sarnecki <lubosz at gmail com>
pkgname=fbneo-git
pkgver=v1.0.0.0.563.g07550be26
pkgrel=1
pkgdesc="Emulator for Arcade Games & Select Consoles. Based on FinalBurn and MAME."
url="https://github.com/finalburnneo/FBNeo"
license=('custom')
arch=('i686' 'x86_64')
replaces=('fbneo')
depends=('sdl2_image')
makedepends=('git')
source=("git+https://github.com/finalburnneo/FBNeo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/FBNeo"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$srcdir/FBNeo"
  make sdl2
}

package() {
  cd "$srcdir/FBNeo"
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install fbneo "$pkgdir"/usr/bin/
  install -m644 src/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
