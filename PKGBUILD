pkgname=dejsonlz4-git
pkgver=9.c4305b8
pkgrel=1
pkgdesc='Decompress Mozilla Firefox bookmarks backup files'
arch=('x86_64')
url='https://github.com/avih/dejsonlz4'
license=('other')
depends=()
makedepends=()
source=("${pkgname}::git+https://github.com/avih/dejsonlz4")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"

  gcc -Wall -o dejsonlz4 src/dejsonlz4.c src/lz4.c    
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D "dejsonlz4" "$pkgdir/usr/bin/dejsonlz4"
}

