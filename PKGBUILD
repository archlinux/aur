# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords-git
pkgver=r96.ed5f7d5
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python' 'python-blessed' 'python-puzpy')
makedepends=('git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  python setup.py build
}

package() {
  cd "${pkgname%-git}"

  python setup.py install --prefix=/usr --root="$pkgdir"
}
