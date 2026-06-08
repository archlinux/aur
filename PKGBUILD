# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-encryptor
pkgver=2.0
pkgrel=1
pkgdesc="Secure AES-256 Encryption for Files and Folders"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'openssl' 'tar')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-encryptor 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-encryptor
  gcc shrike-encryptor.c -o shrike-encryptor $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-encryptor 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-encryptor
  install -Dm755 shrike-encryptor "$pkgdir/usr/bin/shrike-encryptor"
  install -Dm644 shrike-encryptor.desktop "$pkgdir/usr/share/applications/shrike-encryptor.desktop"
}
