# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.10
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7384c1ba32bd8e4b11342570d2144165a60682499b4cb54e50c8eb3164cfabc5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
