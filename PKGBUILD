# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=flterm
pkgver=2.4
pkgrel=2
pkgdesc='Tool for loading data over serial'
arch=('x86_64')
url='https://github.com/timvideos/flterm'
license=('GPL3')
makedepends=('git')
source=("git+$url.git?tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd $pkgname

  export PREFIX='/usr'

  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

