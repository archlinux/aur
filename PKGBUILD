# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-openbox-pipemenus-git
pkgver=r452.5e4e8c4
pkgrel=1
pkgdesc="Collection of Openbox pipemenus from BunsenLabs Linux"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-pipemenus"
license=('GPL3')
depends=('bunsen-common' 'jgmenu' 'lua52' 'lua52-expat' 'lua52-penlight' 'lua52-posix' 'lua52-socket' 'mesa-utils' 'python3' 'python-lxml' 'python-paramiko' 'wget' 'xterm' 'yad')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
