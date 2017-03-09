# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=selfie-git
pkgver=r361.ea302f4
pkgrel=1
pkgdesc="An educational tiny self-compiling C compiler/self-executing MIPS emulator/self-hosting MIPS hypervisor"
arch=('any')
url="http://selfie.cs.uni-salzburg.at/"
license=('BSD')
depends=('gcc-multilib')
source=("git+https://github.com/cksystemsteaching/selfie")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/selfie
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/selfie
  make
}

package() {
  cd ${srcdir}/selfie
  install -Dm755 selfie "${pkgdir}/usr/bin/selfie"
}
