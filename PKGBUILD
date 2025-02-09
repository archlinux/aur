# Maintainer: you-oopsdev <itachi522ru@gmail.com>
_pkgname=zsh-sudo
pkgname=zsh-sudo-git
pkgver=r7341.efafef8
pkgrel=3
pkgdesc="Easily prefix your current or previous commands with sudo by pressing esc twice"
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo"
license=('unknown')
depends=("zsh")
makedepends=("git")
conflicts=('zsh-sudo')
install="${pkgname}.install"
source=(git+https://github.com/ohmyzsh/ohmyzsh.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ohmyzsh/plugins/sudo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/sudo/sudo.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
}

