# Maintainer: Jesse Li <jessejesse123@gmail.com>
_gitname='tty-countdown'
pkgname='tty-countdown-git'
pkgver=r18.e41e733
pkgrel=1
pkgdesc="Simple countdown timer"
arch=('any')
url="https://github.com/veggiedefender/tty-countdown"
license=('GPL')
depends=('python')
makedepends=('git')
source=(
  "git+https://github.com/veggiedefender/tty-countdown"
  "tty-countdown.sh"
)
pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
sha512sums=(
  "SKIP"
  "c4f1a07806919b834e8de9f978ac044d3665f48a8310978d6823a7a9191f7f8755465eb37481242d407d3d47a43e0d76ecc32a78b1067a3c696d672aaa11f7b5"
)
package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/tty-countdown/"
  cp "${srcdir}/tty-countdown.sh" "${pkgdir}/usr/bin/tty-countdown"

  cd "${srcdir}/tty-countdown"
  cp tty-countdown.py "${pkgdir}/usr/share/tty-countdown/"
  cp font.txt "${pkgdir}/usr/share/tty-countdown/"

  chmod +x "${pkgdir}/usr/bin/tty-countdown"
}
