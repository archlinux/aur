# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>
# Contributor: Kacper Sagalara <mail@kasesag.me>

pkgname=xvid4conf
pkgver=1.13
pkgrel=3
pkgdesc="Creates XviD configuration files"
arch=('i686' 'x86_64')
url="https://github.com/twolife/xvid4conf"
license=('GPL2')
depends=('gtk3')
source=($url/archive/refs/heads/main.tar.gz)
md5sums=('2844c329964e1940258b9e5971299450')

build() {
  cd "$pkgname-main"
  ./configure --prefix=/usr --enable-gtk3
  make
}

check() {
  cd "$pkgname-main"
  make check
}

package() {
  cd "$pkgname-main"
  make DESTDIR="$pkgdir" install
}
