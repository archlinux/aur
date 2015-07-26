# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=crosstool-ng
pkgver=1.20.0
pkgrel=1
pkgdesc='Versatile (cross-)toolchain generator'
arch=('i686' 'x86_64')
url='http://crosstool-ng.org/'
license=('GPL')
depends=('make' 'gperf' 'wget')
options=('!makeflags')
source=(http://crosstool-ng.org/download/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('a2dd1fdb325e86b736075155a243fcfc')

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
