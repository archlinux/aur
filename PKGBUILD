# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blueshift
pkgver=1.90.4
pkgrel=3
pkgdesc="An extensible and highly configurable alternative to redshift"
arch=(i686 x86_64)
url="https://github.com/maandree/blueshift"
license=('AGPL3' 'GPL3' 'custom:GFDL1.3')
depends=(python3 solar-python argparser-python pylibgamma libxcb)
optdepends=('adjbacklight: for backlight adjustments without root requirements'
            'linux: for backlight support'
            'wget: for weather support, default command')
makedepends=(gcc python3 libxcb make coreutils sed zip texinfo auto-auto-complete)
install=blueshift.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(d4b8d4e9745d1604d9a3b03d4e9bc4ee3228fa1047f9a3d34b854d06a2e5d0d3)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/blueshift
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/blueshift install DESTDIR="$pkgdir"
}

