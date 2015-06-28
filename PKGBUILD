# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=4dtris
pkgver=0.4.3
pkgrel=1
pkgdesc="A tetris game extended to 4 dimensions"
arch=('i686' 'x86_64')
url="https://launchpad.net/4dtris"
license=('GPL')
depends=('freeglut' 'sdl_ttf')
source=(http://launchpad.net/$pkgname/0.4/$pkgver/+download/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('5c473e87ead71d382eee2fbb5bc6d853')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure  --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/games "${pkgdir}"/usr/bin
}
