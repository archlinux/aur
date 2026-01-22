# Maintainer: Your Name <javierorfo@protonmail.com>
#
pkgname=xtatusbar
pkgver=0.2.1
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot"
arch=('x86_64')
url="https://github.com/javiorfo/xtatusbar"
license=('MIT')
depends=('alsa-lib' 'xorg-xsetroot')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$pkgname"
  gcc -Wall -O3 -o xtatusbar xtatusbar.c -lasound
}

package() {
  cd "$pkgname"

  install -Dm755 xtatusbar "${pkgdir}/usr/bin/xtatusbar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
