# Maintainer: pvtoari <arielroque@protonmail.com>
# Original author: cktan <github.com/cktan>

pkgname=tomlc17-git
pkgver=r116.f6c98d0
pkgrel=1
pkgdesc="TOML parser in C17"
arch=('x86_64')
url="https://github.com/cktan/tomlc17"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
provides=('tomlc17')
conflicts=('tomlc17')
options=('!debug')
source=("git+https://github.com/cktan/tomlc17.git")
sha256sums=('SKIP')

pkgver() {
  cd tomlc17
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd tomlc17
  make
}

package() {
    cd tomlc17
    
    make install DESTDIR="$pkgdir" prefix=/usr
}
