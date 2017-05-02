# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jwwolf <jwwolf+arch@gmail.com>
# Contributor: Bernhard Walle <bernhard@bwalle.de>

pkgname=crosstool-ng
pkgver=1.23.0
pkgrel=1
pkgdesc='Versatile (cross-)toolchain generator'
arch=('i686' 'x86_64')
url='http://crosstool-ng.org/'
license=('GPL')
depends=('make' 'gperf' 'wget')
makedepends=('help2man')
options=('!makeflags')
source=("http://crosstool-ng.org/download/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('dc861702ecce216d1855c8185f0f1873')
sha256sums=('1b76404960f2b35471b6385ba707b8a4712431820fe30063e435dad97ccb02b4')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 ct-ng.comp "$pkgdir"/usr/share/bash-completion/completions/ct-ng
}
