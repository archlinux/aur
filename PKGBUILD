# Maintainer: Dancheg97 <dangdancheg@gmail.com>

pkgname=gen-tools
pkgver=1
pkgrel=1
pkgdesc="Tool for generating project templates written in go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://gitea.dancheg97.ru/templates/gen-tools"
options=(!lto)
license=('GPL3')
depends=(
  'pacman>5'
  'git'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=('go>=1.18')
checks=("skip")

build() {
  git clone https://gitea.dancheg97.ru/templates/gen-tools
  cd gen-tools
  go build .
}

package() {
  cd ..
  install -Dm744 $srcdir/gen-tools/gen-tools $pkgdir/usr/bin/gen-tools
}
