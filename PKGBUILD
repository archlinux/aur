# Maintainer: Finn <finn-ja@gmx.de>

pkgname=comifetch-git
pkgver=1.0.r1.gabcdef
pkgrel=1
pkgdesc="Revolutionäres CLI-Tool zum Anzeigen von Systeminfos mit Hammer-und-Sichel-Logo"
arch=('x86_64')
url="https://gitlab.com/arch1380517/comifetch"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
source=("git+https://gitlab.com/arch1380517/comifetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/comifetch"   # <--- FIXED!
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/comifetch"   # <--- FIXED!
  gcc comifetch.c -o comifetch
}

package() {
  cd "$srcdir/comifetch"   # <--- FIXED!
  install -Dm755 comifetch "$pkgdir/usr/bin/comifetch"
}

