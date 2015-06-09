# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Manish Munikar <munikarmanish at gmail dot com>

pkgname=photocrypt
pkgver=0.6
pkgrel=1
pkgdesc="A text-to-image steganography tool"
arch=('i686' 'x86_64')
depends=('gtkmm' 'opencv' 'openssl')
makedepends=('gcc' 'make' 'pkg-config')
url="https://github.com/mdbct/photocrypt"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/mdbct/$pkgname/tar.gz/$pkgver
        photocrypt.desktop)
sha256sums=('92cb9036c2838aa29c9913b35dd13143f83432d97aa96f1949011511bd1c3164'
            '0614b31b3a1e6e80c737c6711a983be6889e70f78374318b4848f23442cd6801')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Installing desktop entry...'
  install -Dm 644 "$srcdir/photocrypt.desktop" "$pkgdir/usr/share/applications/photocrypt.desktop"
}
