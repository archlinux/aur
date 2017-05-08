# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: nizox <nizzox@gmail.com>

pkgname=grun
pkgver=0.9.3
pkgrel=4
pkgdesc="GTK run dialog"
arch=('i686' 'x86_64')
url="https://github.com/lrgc/grun"
license=('GPL2')
depends=('gtk2')
backup=('etc/consfile' 'etc/gassoc')
source=($pkgname-$pkgver.tar.gz::$url/archive/release_${pkgver//./_}.tar.gz)
md5sums=('dd221f689c211e2ccfacf06bf24b14bc')

build() {
  cd "$pkgname-release_${pkgver//./_}"
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$pkgname-release_${pkgver//./_}"
  make check
}


package() {
  cd "$pkgname-release_${pkgver//./_}"
  make DESTDIR="$pkgdir" install
}
