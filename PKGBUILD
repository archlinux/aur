# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgver=0.6.0.1
pkgrel=1
sha256sums=('23cddf37bd5872553506ec47e21053756f91459d756e9f5793ebd569d2b1b3fa')

pkgname=hascard
pkgdesc="A TUI for reviewing notes using 'flashcards' written with markdown-like syntax."
arch=('any')
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
