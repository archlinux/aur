# Maintainer: Cullen Ross <cullenrss@gmail.com>
pkgver=0.2.1.0
pkgrel=1
sha256sums=('9b49886c72c49424ba26314b0d5da2f595110b379c4ef612dc5a604b6543ad54')

pkgname=hascard
pkgdesc="A TUI for reviewing notes using 'flashcards' written with markdown-like syntax."
arch=('x86_64')
url="https://github.com/Yvee1/hascard"
license=('BSD-3')
makedepends=('stack')
source=(https://github.com/Yvee1/${pkgname}/archive/v${pkgver}.tar.gz)

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  stack install --local-bin-path="${pkgdir}/usr/bin"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
