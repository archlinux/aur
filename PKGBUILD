# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: HackMe <hackme.any@protonmail.com>
pkgname='qwinos-qtile-dracula'
pkgver=1.0
pkgrel=1
pkgdesc="This is automate install of QWinOS(Arch Window Manager) Qtile-Dracula theme"
arch=(x86_64)
url="https://github.com/QWinOS/Qtile-Dracula.git"
license=('MIT')
depends=()
makedepends=(git sh)
checkdepends=()
optdepends=()
provides=(QWinOS)
source=("git+$url")
md5sums=('SKIP')

prepare() {
  cd "Qtile-Dracula"
  # cp config.def.h config.h
}

pkgver() {
  cd "Qtile-Dracula"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "Qtile-Dracula"
  chmod +x Q-Script.sh
  sudo sh Q-Script.sh
}

package() {
  cd "Qtile-Dracula"
}
