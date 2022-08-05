# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=fast-discord
pkgver=3c6ce0c46bd80c20f32b340da3ea68af32e36304
pkgrel=1
pkgdesc='A new Discord client made in C++ and Qt'
url='https://github.com/EnyoYoen/Fast-Discord'
source=("${pkgname}::git+https://github.com/EnyoYoen/Fast-Discord")
arch=('any')
license=('MIT')
makedepends=('cmake')
depends=('git' 'pacman' 'qt5-base' 'opus' 'libsodium')
md5sums=('SKIP')

build () {
  cd "$pkgname/bin"

  cmake ..
  cmake --build .
}

package() {
  cd "$pkgname/bin"
  
  install -Dm644 Fast-Discord "${pkgdir}/usr/bin/fast-discord"
}
