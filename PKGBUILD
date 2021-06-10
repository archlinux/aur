# Maintainer: SO010 <stackoverflow010 at gmail com>

pkgname=vapor-toolbox-git
_pkgname=toolbox
_binname=vapor
pkgver=r1144.4a2b9ed
pkgrel=1
pkgdesc="Vapor Toolbox - A cmdline tool for the Vapor web framework"
arch=('x86_64')
url="https://github.com/vapor/toolbox"
license=('MIT')
depends=('git' 'swift-language' 'curl')
source=("git+https://github.com/vapor/toolbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make DEST="/usr/bin/$_binname" DESTDIR="$pkgdir/" install
}
