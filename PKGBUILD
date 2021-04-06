# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xmountains
pkgver=2.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Fractal Generator for the xwindow system, intergrates with xscreensaver"
url="https://github.com/spbooth/xmountains"
license=('custom')
depends=('libx11' )
makedepends=('imake' 'xbitmaps')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a6d4f18b5cb1e0d8482faf5b5b95657edb61f98f3bef2042714d9e0fe487f14')
sha512sums=('99abfe72c5fc7aa655d328523908aad18d3415a2564374c3c261b1ee534966535fa570fe5f745d4233729e34abc3f7abd3a2619951d1e1f023cc7372bde72129')

build() {
  cd "$pkgname-$pkgver"
  xmkmf
  make
}

package() {
  echo "HEEEERE"
  pwd
  ls "$pkgname-$pkgver"/$pkgname
  echo $pkgdir
  install -D -m755 "$pkgname-$pkgver/$pkgname" "$pkgname"/usr/bin/$pkgname
  install -D -m644 "$pkgname-$pkgver/$pkgname.man" \
    "$pkgname"/usr/share/man/man1/$pkgname.1
  install -D -m644 "$pkgname-$pkgver/copyright.h" \
    "$pkgname"/usr/share/licenses/$pkgname/copyright.h
}
