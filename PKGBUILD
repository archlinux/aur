# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Sean Pringle <sean.pringle@gmail.com>

pkgname=goomwwm
pkgver=1.0.0
pkgrel=2
pkgdesc="Get out of my way, Window Manager!"
arch=('i686' 'x86_64')
url="http://aerosuidae.net/goomwwm"
license=('MIT')
depends=('libxft' 'libxinerama')
optdepends=('dmenu')
makedepends=()
source=("http://aerosuidae.net/goomwwm/$pkgname-$pkgver.tar.gz")
md5sums=('cf735179b7db6829e40795e1f2aa9f20')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
  gzip -c "$pkgname.1" > "$pkgname.1.gz"
  install -Dm644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

