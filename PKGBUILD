# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: casa <sympho08@yandex.ru>

pkgname=mednaffe 
pkgver=0.8.6
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk3')
source=(https://github.com/AmatCoder/mednaffe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('088acecb5b877d5205bd08bde1a55a865823ddc2')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
