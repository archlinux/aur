# Maintainer: Sunny <brainworms2002 at gmail dot com>

pkgname="niri-float-sticky"

pkgver=0.0.5
pkgrel=1
pkgdesc="A utility to make floating windows visible across all workspaces in niri"
url="https://github.com/probeldev/niri-float-sticky"
license=("MIT")
arch=("x86_64")
provides=("$pkgname")
replaces=()
makedepends=('go')
options=("!strip")

source=(
  "git+https://github.com/probeldev/niri-float-sticky.git"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname"
  go build
}

package() {
  # move binary to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/$pkgname/$pkgname" "${pkgdir}/usr/bin/$pkgname"

  # set permissions
  chmod -R u+rwX,go+rX,go-w "${pkgdir}/"
}
