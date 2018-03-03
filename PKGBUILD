# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=ttyqr-git
pkgver=r5.56f7658
pkgrel=2
pkgdesc="Draw QR codes straight into the terminal"
url="https://github.com/oskar456/ttyqr"
arch=('x86_64')
license=('GPL3')
depends=('qrencode')
makedepends=('git')
source=("$pkgname::git+https://github.com/oskar456/ttyqr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "$pkgname"
}

package() {
  cd "$pkgname"
  install -Dm 0755 ttyqr "$pkgdir/usr/bin/ttyqr"
}
