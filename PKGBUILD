pkgname=devt-git
pkgver=r7.bf16d0c
pkgrel=1
pkgdesc="A simple dev tool CLI to encode/decode/hash/generate strings"
arch=('x86_64')
url="https://github.com/Rokkit-exe/devt-git"
license=('GPL3')
depends=()
makedepends=('go' 'git')
provides=('devt')
conflicts=('devt')
source=("git+ssh://git@github.com/Rokkit-exe/devt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/devt"
  # Use the number of commits + short hash for pkgver
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/devt"
  go build -o devt
}

package() {
  install -Dm755 "$srcdir/devt/devt" "$pkgdir/usr/bin/devt"
}
