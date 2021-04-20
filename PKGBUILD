# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=archlinux-repro-git
pkgver=r247.691d869
pkgrel=1
pkgdesc='Tools to reproduce arch linux packages'
arch=('any')
license=('MIT')
makedepends=('git' 'asciidoc')
depends=('diffoscope' 'curl' 'gnupg' 'git' 'diffutils' 'zstd')
provides=('archlinux-repro')
replaces=('archlinux-repro')
url="http://github.com/archlinux/archlinux-repro"
source=("git+https://github.com/archlinux/archlinux-repro.git")
sha256sums=('SKIP')

pkgver() {
  cd archlinux-repro
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd archlinux-repro
  make
}

package() {
  cd archlinux-repro
  make PREFIX=/usr DESTDIR="$pkgdir" PROGNM=$pkgname install
}
