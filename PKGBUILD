# Maintainer: tech hat
pkgname=nanofetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight system information tool written in C++"
arch=('x86_64')
url="https://github.com/tinyopsec/nanofetch"
license=('MIT')
depends=('glibc')
source=(
  'nanofetch.cpp'
  'config.txt'
  'options.txt'
  'settings.txt'
  'logo.txt'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  g++ -O2 -s -o nanofetch nanofetch.cpp
}

package() {
  install -Dm755 nanofetch "$pkgdir/usr/bin/nanofetch"
  install -Dm644 config.txt   "$pkgdir/usr/share/nanofetch/config.txt"
  install -Dm644 options.txt  "$pkgdir/usr/share/nanofetch/options.txt"
  install -Dm644 settings.txt "$pkgdir/usr/share/nanofetch/settings.txt"
  install -Dm644 logo.txt     "$pkgdir/usr/share/nanofetch/logo.txt"
}
