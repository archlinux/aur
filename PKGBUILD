# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>
pkgname=wizardscastle-ncurses
pkgver=1.0.2
pkgrel=1
pkgdesc="A classic dungeon-crawling game"
arch=('i686' 'x86_64')
url="https://github.com/beejjorgensen/Wizards-Castle-Ncurses"
license=('MIT')
depends=("ncurses")
makedepends=("rust>=1.31.0")
source=($pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('636622af578fde45b32bd21f246116497702d2a9f87c79d384cbdaf78620515733050b285c4d54e20db936e69d1324c0d5a674676e572e0b6b0e841cfdf379b3')

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
