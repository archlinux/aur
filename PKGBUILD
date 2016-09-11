# Maintainer: Jesse Li <jessejesse123@gmail.com>
_gitname='tty-countdown'
pkgname='tty-countdown-git'
pkgver=r9.7226eaa
pkgrel=1
pkgdesc="Simple countdown timer"
arch=('any')
url="https://github.com/veggiedefender/tty-countdown"
license=('GPL')
depends=('python')
makedepends=('git')
source=("git+https://github.com/veggiedefender/tty-countdown")
pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
md5sums=("SKIP")
package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/tty-countdown/"
  cd "${srcdir}/tty-countdown"
  cp tty-countdown "${pkgdir}/usr/bin/"
  cp font.txt "${pkgdir}/usr/share/tty-countdown/"
  chmod +x "${pkgdir}/usr/bin/tty-countdown"
}