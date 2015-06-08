# Maintainer: Reza Jelveh (reza.jelveh@tuhh.de)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='horst'
pkgver='4.2'
pkgrel='0'
pkgdesc="A small, lightweight IEEE802.11 wireless LAN analyzer with a text interface"
arch=('any')
url='http://br1.einfach.org/tech/horst'
depends=('ncurses' 'iw')
makedepends=('ncurses')
license=('GPL')
source=("http://br1.einfach.org/${pkgname}_dl/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eab46330998a4c6d5abc9bfdad739b62b57c65049ac6f160e58ee3edd3260057')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  pushd "$pkgname-$pkgver"
  install -Dm644 "horst.1" "$pkgdir/usr/share/man/man1/horst.1"
  install -Dm755 "horst" "$pkgdir/usr/bin/horst"
  popd
}
