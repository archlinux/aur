# Maintainer: casa <sympho08@yandex.ru>

pkgname=mednaffe 
pkgver=0.7
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/amatcoder/mednaffe"
license=('GPL')
install=mednaffe.install
depends=('mednafen' 'gtk3')
source=(https://sites.google.com/site/amatcoder/mednaffe/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('56ac6c4d89638f9384920f6ea6b72e3c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
