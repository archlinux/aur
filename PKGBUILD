# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>

pkgname=9wm
pkgver=1.4.2
pkgrel=1
pkgdesc="X11 Window Manager inspired by Plan 9's rio"
arch=('i686' 'x86_64')
url="https://github.com/9wm/9wm"
license=('MIT')
depends=('libxext' 'libxau' 'libxdmcp')
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('7c7b9c6510de633af7ab46e9f85bb8ed916b021d012482e5ca01651be55b79f6')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.man "${pkgdir}"/usr/share/man/man1/$pkgname.1
#license
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
