# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=mdp
pkgver=1.0.14
pkgrel=1
pkgdesc="A command-line based markdown presentation tool"
arch=('x86_64')
url="https://github.com/visit1985/mdp"
license=('GPL3')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visit1985/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8dc6313dc8d1821df4818fce6443b71e266dddc80f1db1d2cb4877d35b947806')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
