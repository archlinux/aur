# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=latexrun-git
pkgver=r134.38ff6ec
pkgrel=1
pkgdesc="A 21st century LaTeX wrapper"
arch=('any')
url="https://github.com/aclements/latexrun"
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'git'
)

source=(
  'git+https://github.com/aclements/latexrun.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd latexrun
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd latexrun

  # Copy the main script
  install -D -m755 latexrun $pkgdir/usr/bin/latexrun
}
