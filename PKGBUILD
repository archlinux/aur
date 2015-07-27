# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jwwolf <jwwolf+arch@gmail.com>
# Contributor: Bernhard Walle <bernhard@bwalle.de>

pkgname=crosstool-ng
pkgver=1.21.0
pkgrel=2
pkgdesc='Versatile (cross-)toolchain generator'
arch=('i686' 'x86_64')
url='http://crosstool-ng.org/'
license=('GPL')
depends=('make' 'gperf' 'wget')
options=('!makeflags')
source=(http://crosstool-ng.org/download/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('436c95ce91a9140fa03ddb32fc0db3f5')
sha256sums=('67122ba42657da258f23de4a639bc49c6ca7fe2173b5efba60ce729c6cce7a41')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ct-ng.comp "$pkgdir"/usr/share/bash-completion/completions/ct-ng
}
