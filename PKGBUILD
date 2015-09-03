# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: peter feigl <peter.feigl@gmail.com>

pkgname=mit-scheme
pkgver=9.2
pkgrel=1
pkgdesc='MIT/GNU Scheme'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnu.org/software/mit-scheme/'
depends=('glibc' 'ncurses' 'zlib')
optdepends=('openssl: support for openssl')

source_i686=(http://ftp.gnu.org/gnu/$pkgname/stable.pkg/$pkgver/$pkgname-$pkgver-i386.tar.gz)
source_x86_64=(http://ftp.gnu.org/gnu/$pkgname/stable.pkg/$pkgver/$pkgname-$pkgver-x86-64.tar.gz)
md5sums_i686=('b80458f85b9521bdfb0620edc89e3e61')
md5sums_x86_64=('9fcc6c156e53efeb0560996551fa0a57')

build() {
  cd $pkgname-$pkgver/src
  ./configure --prefix=/usr \
    --with-x \
    --enable-native-code
  make
}

package() {
  cd $pkgname-$pkgver/src
  make DESTDIR="$pkgdir" install
}
