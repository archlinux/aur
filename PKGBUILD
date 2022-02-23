# Maintainer: Dorian Rudolph <mail@dorianrudolph.com>
_pkgname=jabbrv
pkgname=$_pkgname-git
pkgver=r37.ee76d79
pkgrel=1
pkgdesc="Automatic Journal Title Abbreviation Package for LaTeX"
arch=('x86_64')
url="https://github.com/compholio/jabbrv"
license=('custom')
groups=()
depends=('texlive-core')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/compholio/jabbrv.git#commit=ee76d797596577c62c13491e55de7426933d8974")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
}

package() {
  cd "$srcdir/$_pkgname"
  BASE_FOLDER="$pkgdir/usr/share/texmf"
  INSTALL_LTX_FOLDER="${BASE_FOLDER}/tex/latex/jabbrv"
  INSTALL_BST_FOLDER="${BASE_FOLDER}/bibtex/bst/jabbrv"
  mkdir -p "${INSTALL_LTX_FOLDER}";
  mkdir -p "${INSTALL_BST_FOLDER}";
  cp *.sty "${INSTALL_LTX_FOLDER}/"
  cp *.ldf "${INSTALL_LTX_FOLDER}/"
  cp *.bst "${INSTALL_BST_FOLDER}/"
}

# vim:set ts=2 sw=2 et:

