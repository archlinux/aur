# Maintainer: naruto522ru <itachi522ru@gmail.com>
_pkgname=zsh-sudo
pkgname=zsh-sudo-git
pkgver=r6614.6622210d7
pkgrel=2
pkgdesc="Easily prefix your current or previous commands with sudo by pressing esc twice"
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo"
license=('unknown')
depends=("zsh")
makedepends=("git")
install="${pkgname}.install"
source=(git+https://github.com/ohmyzsh/ohmyzsh.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ohmyzsh/plugins/sudo/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/sudo/sudo.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
}

