# Maintainer: Yatis <yann.magnin@epitech.eu>
_basename="blih_cli"
_branch="master"

pkgname="blih_cli-git"
pkgdesc="(dev version) Blih CLI (say blikli) is the Blih (Bocal Lightweight Interface for Humans) Js CLI (Command-Line Interface) for linux env."
pkgver=1.0.1_2_gfc82675
pkgrel=2

arch=('i686' 'x86_64')
source=("${pkgname}::git+https://github.com/GreenDjango/${_basename}.git#branch=${_branch}")
depends=('nodejs' 'npm')
options=("!strip")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}" || exit
  git show --format=\"%H\" --no-patch | git describe --tags | sed 's/v//' | sed 's/-/_/g'
}
build() {
  return 0
}
package() {
  cd "${pkgname}" || exit

  sudo sh ./install.sh
  return 0
}
