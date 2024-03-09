# Maintainer: espritlibre <e-mail>
_pkgname=zsh-timer
pkgname=zsh-timer-git
pkgver=r7156.06753e814
pkgrel=1
pkgdesc="This plugin allows to display command's execution time in a very nonintrusive way."
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/timer"
license=('unknown')
depends=("zsh")
makedepends=("git")
install="${pkgname}.install"
source=(git+https://github.com/ohmyzsh/ohmyzsh.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ohmyzsh/plugins/timer/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/timer/README.md" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"

  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/timer/timer.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
}

