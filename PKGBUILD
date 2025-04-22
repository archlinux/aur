# Maintainer: Finn <finn-ja@gmx.de>

pkgname=comifetch-git
pkgver=1.0.r1.gabcdef
pkgrel=1
pkgdesc="Revolutionäres CLI-Tool zum Anzeigen von Systeminfos mit Hammer-und-Sichel-Logo"
arch=('x86_64')
url="https://gitlab.com/dein-username/comifetch"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  gcc comifetch.c -o comifetch
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 comifetch "$pkgdir/usr/bin/comifetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
