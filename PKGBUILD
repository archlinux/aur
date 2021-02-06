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
  "ccd624004a04160ba1790cd689dc4302ea4e7abc16521fa8cd4023a9167c6cc95ce71aba8d5c2aff51069a7d7a414bd2724eb0977666706f5ec57ba729f1d974"
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
