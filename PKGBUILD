# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Sean Pringle <sean.pringle@gmail.com>

pkgname=goomwwm
pkgver=1.0.0
pkgrel=3
pkgdesc="Get out of my way, Window Manager!"
arch=('i686' 'x86_64')
url="https://github.com/seanpringle/goomwwm"
license=('MIT')
depends=('libxft' 'libxinerama')
optdepends=('dmenu')
makedepends=()
source=("https://github.com/seanpringle/goomwwm/archive/$pkgver.tar.gz")
md5sums=('6b83b6db787966ea43fccea4687f8c68')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
  gzip -c "$pkgname.1" > "$pkgname.1.gz"
  install -Dm644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

