# Maintainer: Sajeev Ramasamy <thorion3006@gmail.com>
pkgname=dracula-icons-git
pkgver=1.0.0.2d3c83ca
pkgrel=2
pkgdesc="Dark Icons Theme for Linux Desktops"
arch=('any')
url="https://github.com/m4thewz/dracula-icons.git"
license=()
depends=()
makedepends=('git')
provides=('dracula-icons')
conflicts=('dracula-icons')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd dracula-icons
  printf "1.0.0.$(git log --format="%h" -n 1)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/icons/Dracula"
  cp -r dracula-icons/* "${pkgdir}/usr/share/icons/Dracula"
  chmod -R 755 "${pkgdir}/usr/share/icons/Dracula"
  chmod 644 "${pkgdir}/usr/share/icons/Dracula/index.theme"
}
