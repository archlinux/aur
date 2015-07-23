# Maintainer: Edvard Holst <edvard.holst at gmail> 

pkgname=aes-encrypt-git
pkgver=r9.a9165bd
pkgrel=1
pkgdesc="A really simple helper script for AES 256 CBC file encryption using openssl"
arch=('any')
url="https://github.com/Zyg0te/filecrypt"
license=('MIT')
depends=('openssl')
makedepends=('git')
source=($pkgname::git+'https://github.com/Zyg0te/filecrypt.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 aes-encrypt "$pkgdir"/usr/bin/aes-encrypt
}