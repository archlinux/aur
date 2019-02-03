# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>
pkgname=wizcas-ncurses
pkgver=1.0.0
pkgrel=1
pkgdesc="Classic dungeon-crawling game"
arch=('i686' 'x86_64')
url="https://github.com/beejjorgensen/Wizards-Castle-Ncurses"
license=('MIT')
makedepends=("rust>=1.31.0")
source=($pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('46c85f2de4d32c8c0837a71a22f461cf43119c36a454008a024c5daa68fdb5257747aaec8471a4532612aac46df6cc4a470d3c78012c9cfcd3b06318880fa197')

build() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  cargo build --release --locked
}

package() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  install -Dm 755 target/release/wizards_castle_ncurses "${pkgdir}/usr/bin/wizcas"
  install -Dm 644 wizcas.6 -t "${pkgdir}/usr/share/man/man6/"
}
