# Maintainer: Ahmed Jerjawi <your_email@example.com>
# URL: https://github.com/ahmadjerjawi/vfdecrypt-linux
# Description: A tool for decrypting .dmg files, reworked to support OpenSSL 3
# License: GPL-3.0

pkgname=vfdecrypt
pkgver=2025.1
pkgrel=1
pkgdesc="A tool for decrypting .dmg files, reworked to support OpenSSL 3"
arch=('x86_64')
url="https://github.com/ahmadjerjawi/vfdecrypt-linux"
license=('GPL3')
depends=('openssl')
source=("git+https://github.com/ahmadjerjawi/vfdecrypt-linux.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/vfdecrypt-linux"

  # Build the project
  gcc -o vfdecrypt vfdecrypt.c -lssl -lcrypto
}

package() {
  cd "$srcdir/vfdecrypt-linux"

  # Install the binary
  install -Dm755 vfdecrypt "$pkgdir/usr/bin/vfdecrypt"
}
