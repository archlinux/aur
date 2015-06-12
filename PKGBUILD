# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blueshift
pkgver=1.90.3
pkgrel=1
pkgdesc="An extensible and highly configurable alternative to redshift"
arch=(i686 x86_64)
url="https://github.com/maandree/blueshift"
license=('AGPL3' 'GPL3' 'custom:GFDL1.3')
depends=(python3 solar-python argparser pylibgamma libxcb)
optdepends=('adjbacklight: for backlight adjustments without root requirements'
            'linux: for backlight support'
            'wget: for weather support, default command')
makedepends=(cython gcc python3 libxcb make coreutils sed zip texinfo auto-auto-complete)
install=blueshift.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(70bac54b6d8fad0bd2f88dff0d7dca94d3fd316541f23b3326dbbd70982c0698)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/blueshift
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/blueshift install DESTDIR="$pkgdir"
}

