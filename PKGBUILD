# Maintainer: Hristo Tanev <hristo.tanev@outlook.com>
pkgname=dotfiles-hristotanev-git
pkgver=1.0.0
pkgrel=1
pkgdesc="This is my personal set of .dotfiles and some other configs"
arch=(x86_64)
url="https://github.com/hristotanev/.dotfiles.git"
license=('GPL')
groups=()
depends=()
makedepends=(git rcm)
checkdepends=()
optdepends=()
provides=(dotfiles)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(git describe --abbrev=0 | cut -d "v" -f2)"
}

package() {
  cd .dotfiles
  mkdir $HOME/.dotfiles && cp -rf * $HOME/.dotfiles
  ~/.dotfiles/install.sh
}
