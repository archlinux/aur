# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>
pkgname=wizcas-ncurses
pkgver=1.0.1
pkgrel=1
pkgdesc="Classic dungeon-crawling game"
arch=('i686' 'x86_64')
url="https://github.com/beejjorgensen/Wizards-Castle-Ncurses"
license=('MIT')
makedepends=("rust>=1.31.0")
source=($pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7c4942be7e36a1f9fe9d423ab96070231e61e539fac64907595c33791363587893847560a18132c1d1d578f8cc715e40bb2093a5a6a6c75c7b600752f0df0d6e')

build() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  cargo build --release --locked
}

package() {
  cd "Wizards-Castle-Ncurses-$pkgver"

  install -Dm 755 target/release/wizards_castle_ncurses "${pkgdir}/usr/bin/wizcas"
  install -Dm 644 wizcas.6 -t "${pkgdir}/usr/share/man/man6/"
}
