# Maintainer: Marcel Huber <`rev <<<"moc.liamg@oofrebuhlecram"`>
# Contributor: count-corrupt <corrupt at giggedy dot de>

pkgname=cisco-encrypt
pkgver=1.0
pkgrel=2
pkgdesc='Password encoder for Cisco VPN client'
url='https://github.com/coldfix/cisco-encrypt.git'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libgcrypt>=1.1.90')
source=($pkgname::git+https://github.com/coldfix/cisco-encrypt.git)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  gcc -Wall -o "${pkgname}" cisco-encrypt.c $(libgcrypt-config --libs --cflags)
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
