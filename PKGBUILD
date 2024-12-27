# Maintainer: Your Jonathan Donszelmann <jonabent@gmail.com>

pkgname="dumpasm-git"
pkgver=r15.8f2bb63
pkgrel=1
pkgdesc="compile semicolon seperated assembly instructions and hexdump"
arch=('any')
url="https://github.com/jonay2000/dumpasm"
license=('unknown')
depends=('bash' 'binutils' 'nasm')
makedepends=('git')
provides=('dumpasm')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "dumpasm"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  install -Dm755 "dumpasm/dumpasm" -t "${pkgdir}/usr/bin/"
}
