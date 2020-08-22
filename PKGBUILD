# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=bim-git
pkgver=r821.cd56264
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=('x86_64')
license=('ISC')
conflicts=('bim')
makedepends=('git')
url='https://github.com/klange/bim'
source=("git+https://github.com/klange/bim.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 cd "$srcdir/bim"
 make
}

package() {
 cd "$srcdir/bim"
 make DESTDIR="${pkgdir}" install
}

