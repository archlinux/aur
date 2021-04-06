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
b2sums=('55b49a89374f734a865497e1cd896fdf0750704c398ac9b011c146a783215f40113727addee0637199c2ca83c42e0771e3a7e5790856465805b746373e5bb285')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "$pkgname-$pkgver"
  xmkmf
  make
}

package() {
  install -D -m755 "$pkgname-$pkgver/$pkgname" "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$pkgname-$pkgver/$pkgname.man" \
    "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -D -m644 "$pkgname-$pkgver/copyright.h" \
    "$pkgdir"/usr/share/licenses/$pkgname/copyright.h
}
