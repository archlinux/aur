# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Cullen Ross <cullenrss@gmail.com>
pkgver=0.5.0.3
pkgrel=1
sha256sums=('dfb17dc0fdb437c7206a853e2f38e58edfc703e0b9234f194cb9f5d223bf1f2b')

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
