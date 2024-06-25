# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-pipemenus-git
pkgver=r452.5e4e8c4
pkgrel=2
pkgdesc="Various Openbox and jgmenu pipemenus"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-pipemenus"
license=('GPL-3.0-or-later')
depends=('bunsen-common' 'jgmenu' 'lua52' 'lua52-expat' 'lua52-penlight' 'lua52-posix' 'lua52-socket' 'mesa-utils' 'python3' 'python-lxml' 'python-paramiko' 'wget' 'xterm' 'yad')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "bunsen-openbox-pipemenus")
source=("${pkgname}::git+https://github.com/BunsenLabs/bunsen-pipemenus.git#branch=boron")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" bin/bl-*
}
