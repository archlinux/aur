# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.4.2
pkgrel=3
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('x86_64')
url="https://drobilla.net/software/$pkgname/"
license=('GPL3')
depends=('gtkmm' 'graphviz')
makedepends=('python')
source=("https://download.drobilla.net/ganv-$pkgver.tar.bz2")
sha512sums=('0609dea81cceb0c560286ad2f132f318c2d583af5163dcea4511155e78a022248dcb7ae535233493bdf906fb036422ebd4368d688123f3e1676c4e0398cbc6c2')

build() {
  cd "${pkgname}-${pkgver}"
  ./waf configure --prefix=/usr
  ./waf "${MAKEFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
