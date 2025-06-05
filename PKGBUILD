# Maintainer: Shi Yanling <sylphenix@outlook.com>

pkgname=sff
pkgver=1.1
pkgrel=1
pkgdesc="Simple and fast terminal file manager"
arch=('x86_64')
license=('BSD')
url="https://codeberg.org/sylphenix/sff"
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 CHANGELOG.md README.md ${pkgdir}/usr/share/doc/${pkgname}/
}
