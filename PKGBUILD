# Maintainer: soloturn@gmail.com

_basename=smithay
pkgname="$_basename-git"
pkgver=v0.2.0.r245.ge402af48
pkgrel=1
pkgdesc="A smithy for rusty wayland compositors"
arch=('i686' 'x86_64')
url="https://github.com/Smithay/smithay"
license=('MIT')
depends=()
makedepends=('git' 'rust')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git://github.com/Smithay/$_basename.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}/anvil
  cargo run -- --winit
}

package() {
  cd ${pkgname}
}

