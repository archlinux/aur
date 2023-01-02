# Maintainer: soloturn@gmail.com

_basename=smithay
pkgname="$_basename-git"
pkgver=v0.3.0.r1255.gc85e1e52
pkgrel=1
pkgdesc="A smithy for rusty wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/Smithay/smithay"
license=('MIT')
depends=()
makedepends=('git' 'rust')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git+https://github.com/Smithay/$_basename.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}/anvil
  cargo build
  # to run:
  # cargo run -- --winit
}

package() {
  cd ${pkgname}
}

