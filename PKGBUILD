# Maintainer: Yatis <yann.magnin@epitech.eu>
_basename="blih_cli"
_branch="master"

pkgname="blih_cli-git"
pkgdesc="Blih CLI (say blikli) is the Blih (Bocal Lightweight Interface for Humans) Js CLI (Command-Line Interface) for linux env."
pkgver=r60.a92a49e
pkgrel=2

arch=('i686' 'x86_64')
source=("${pkgname}::git+https://github.com/GreenDjango/${_basename}.git#branch=${_branch}")
depends=('nodejs' 'npm')
options=("!strip")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "${pkgname}" || exit

  command -v ${_basename} > /dev/null && sudo sh uninstall.sh
  return 0
}
build() {
  # There is nothing to build ? Nice
  return 0
}
package() {
  cd "${pkgname}" || exit

  sudo sh ./install.sh
  return 0
}
