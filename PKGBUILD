# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.12
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9faca0245babd54aa47cbbb72c14244ca9a9a84f63021a679078041da4f6e98b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
