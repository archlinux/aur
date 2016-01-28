# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=vimdecrypt
pkgname=vimdecrypt-git
pkgver=r21.975fdb7
pkgrel=1
pkgdesc="Command line tool for decrypting vim-blowfish-encrypted files."

arch=('i686' 'x86_64')
url="https://github.com/gertjanvanzwieten/vimdecrypt"
license=('GPL2')

depends=('glibc')
makedepends=('git' 'make' 'gcc')

source=("git+https://github.com/gertjanvanzwieten/vimdecrypt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "vimdecrypt" "$pkgdir/usr/bin/vimdecrypt"
}

