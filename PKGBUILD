# Maintainer: rivo nurges <rivo@surfar.ee>

pkgname=dterm-git
pkgver=r6.dea09ce
pkgrel=1
pkgdesc='Simple serial terminal emulator'
url='https://github.com/hefloryd/dterm'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('readline')
optdepends=('lrzsz: for X/Y/ZMODEM file transfer functionality')
source=("${pkgname}::git+https://github.com/hefloryd/dterm.git")
md5sums=('SKIP')
conflicts=('dterm')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  make
}

package() {
  cd "${srcdir}"/${pkgname}
  install -D dterm "${pkgdir}"/usr/bin/dterm
  install -D -m 0644 README.txt "${pkgdir}"/usr/share/doc/dterm/README.txt
}
