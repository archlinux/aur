# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=hex2hcd-git
pkgver=r2.1175dce
pkgrel=2
pkgdesc="Convert broadcom hex firmware into hcd format."
arch=(any)
url="https://github.com/jessesung/hex2hcd"
license=("Custom")
source=('hex2hcd::git+https://github.com/jessesung/hex2hcd.git')
sha256sums=('SKIP')
provides=('hex2hcd')

pkgver() {
  cd "${srcdir}/hex2hcd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/hex2hcd"
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "${srcdir}/hex2hcd/hex2hcd" "${pkgdir}/usr/bin/hex2hcd"
}

