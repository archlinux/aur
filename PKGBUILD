# Maintainer: Dorian Rudolph <mail@dorianrudolph.com>
_pkgname=jabbrv
pkgname=$_pkgname-git
pkgver=r49.d922ed6
pkgrel=1
pkgdesc="Automatic Journal Title Abbreviation Package for LaTeX"
arch=('x86_64')
url="https://github.com/compholio/jabbrv"
license=('LPPL')
groups=()
depends=('texlive-core')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/compholio/jabbrv.git")
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
