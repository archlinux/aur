# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=pywal-discord-git
pkgver=r83.5ca587a
pkgrel=1
pkgdesc="A script that dynamically generates discord theme based on the current wal colorscheme"
arch=("any")
url="https://github.com/FilipLitwora/pywal-discord"
license=("GPL3")
conflicts=("pywal-discord")
provides=("pywal-discord")
source=("git+https://github.com/FilipLitwora/pywal-discord")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/pywal-discord"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgdir}"
  install -Dm755 "${srcdir}/pywal-discord/pywal-discord" usr/bin/pywal-discord
  mkdir -p usr/share/
  cp -r "${srcdir}/pywal-discord/config" usr/share/pywal-discord
}
