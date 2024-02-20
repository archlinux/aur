# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-openbox-pipemenus-git
pkgver=r448.c1c32f8
pkgrel=1
pkgdesc="Collection of Openbox pipemenus from BunsenLabs Linux"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-pipemenus"
license=('GPL3')
depends=('openbox' 'bunsen-common-git' 'zenity' 'wget' 'curl' 'picom' 'tar' 'python' 'python-paramiko' 'mesa' 'lua' 'lua-expat' 'lua-penlight' 'lua-posix-git' 'lua-socket' 'bunsen-utilities-git')
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
