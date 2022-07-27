# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>
pkgname=wizardscastle-ncurses
pkgver=1.0.5
pkgrel=1
pkgdesc="A classic dungeon-crawling game"
arch=('i686' 'x86_64')
url="https://github.com/beejjorgensen/Wizards-Castle-Ncurses"
license=('MIT')
depends=("ncurses")
makedepends=("rust")
source=($pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('48ee0459acb39b7ceb70efa5c87658aa0caed28dfb138b74ec5b628fbda5f9b1948f4089f6bdf778d9247001974c77e4a80db5b7fb388bc63a18c23cb7c929ab')

build() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  cargo build --release --locked
}

package() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  install -Dm 755 target/release/wizards_castle_ncurses "${pkgdir}/usr/bin/wizardscastle"
  install -Dm 644 wizcas.6 "${pkgdir}/usr/share/man/man6/wizardscastle.6"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/wizardscastle-ncurses"
}
