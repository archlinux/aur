pkgname=treeleaves-git
pkgver=0.3.1
pkgrel=1
arch=('any')
pkgdesc='Directory based file tag generator and search tool' 
url='https://github.com/jmdaemon/treeleaves'
license=('AGPL3')
options=(!strip) # Mandatory as stripping the binary removes the sbcl runtime
depends=('sbcl')
optdepends=()
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/jmdaemon/treeleaves#branch=master")
provides=(treeleaves)
conflicts=(treeleaves)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  make build
}

package-bin() {
    BIN_DIR="$pkgdir"/usr/bin
    mkdir -p $BIN_DIR
    install bin/treeleaves "$BIN_DIR/treeleaves"
}

package() {
  cd "$pkgname"
  package-bin
}
