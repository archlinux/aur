# Maintainer: Cullen Ross <cullenrss@gmail.com>
pkgver=0.3.0.1
pkgrel=1
sha256sums=('9d600c6bd53ab5ac7fea38414a2bd9dc394f2ad03d0126572119d6aa1866585a')

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
