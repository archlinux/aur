# Maintainer: jef <jeffreylec@gmail.com>

pkgname=gruvbox-tilix-git
pkgver=r7.8c01335
pkgrel=2
pkgdesc="Gruvbox theme for Tilix"
arch=("any")
url="https://github.com/MichaelThessel/tilix-gruvbox"
license=("MIT")
depends=("tilix>=1.5")
makedepends=("git")
source=("${pkgname}::git+https://github.com/MichaelThessel/tilix-gruvbox.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-dark-hard.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-dark-medium.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-dark-soft.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-dark.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-light-hard.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-light-medium.json" "${HOME}/.config/tilix/schemes/"
  install -D -m 0644 "gruvbox-light-soft.json" "${HOME}/.config/tilix/schemes/"
}
