# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>

pkgname=9wm
pkgver=1.3.1
pkgrel=1
pkgdesc="Window manager modeled after Plan 9's 8 1/2"
arch=('i686' 'x86_64')
url="https://woozle.org/neale/src/9wm/"
license=('MIT')
depends=('libxext' 'libxau' 'libxdmcp')
source=(http://woozle.org/neale/g.cgi/x11/$pkgname/snapshot/$pkgname-$pkgver.tar.gz)
sha256sums=('d6dc8daa2d880077e4a6bb535d23d03b51dd7f5aee58315e000c1e739cb01bda')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  CPPFLAGS=""
  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.man "${pkgdir}"/usr/share/man/man1/$pkgname.1
#license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
