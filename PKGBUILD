# Maintainer: Cullen Ross <cullenrss@gmail.com>
pkgver=0.5.0.0
pkgrel=1
sha256sums=('7e8c4e3190b6be4cd092c319ef6c9e26a49df40a87fbd74eca52adf19def50d1')

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
