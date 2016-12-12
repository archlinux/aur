# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=gojot
pkgver=2.1.0
pkgrel=1
pkgdesc="A command-line journal that is distributed and encrypted."
arch=('x86_64' 'i686')
url="https://gojot.schollz.com/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=('https://github.com/schollz/gojot/archive/latest.tar.gz')
sha256sums=('f72f4b919459e663e9759f2deb6ff5f6c7847dd2cf82bef4d47e67534c2c12bb')

build() {
  cd "$pkgname-latest"

  go build
}

package() {
  cd "$pkgname-latest"

  install -Dm755 "$pkgname-latest" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
