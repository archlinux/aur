# Maintainer: soloturn@gmail.com

_basename=meadowlark
pkgname="$_basename-git"
pkgver=0.0.0
pkgrel=1
pkgdesc="Opensource DAW (digital audio workstation)"
arch=('i686' 'x86_64')
url="https://github.com/MeadowlarkDAW/Meadowlark"
license=('GPL-3')
depends=()
makedepends=('git' 'rust')
conflicts=("$_basename")
provides=("$_basename")

source=("$pkgname::git+https://github.com/MeadowlarkDAW/$_basename.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  echo 0.0.0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  cargo build
}

package() {
  cd ${pkgname}
}

