# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=stribogsum
pkgver=1.0
pkgrel=1
pkgdesc="The Stribog hash function, developed by the Federal Security Service (FSB) and InfoTeKS"
arch=('i686' 'x86_64')
makedepends=('make')
url="https://www.gostcrypt.org/download.php"
license=('GPL3')
source=(https://www.gostcrypt.org/download/$pkgver/linux/${pkgname^}.tar.gz)
sha256sums=('978e81f7de8d4d13c3e11fc2122261146f4b045adebfc20d5a41c200dd9c9bed')

build() {
  cd "$srcdir/${pkgname^}"

  msg2 'Building...'
  make
}

package() {
  cd "$srcdir/${pkgname^}"

  msg2 'Installing...'
  install -Dm 755 stribogsum "$pkgdir/usr/bin/stribogsum"
}
