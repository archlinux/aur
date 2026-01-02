# Maintainer: ivan4 <prostoklik242@gmail.com>
pkgname=mamofetch-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Быстрый системный фетч с погодой и поддержкой Xeon"
arch=('x86_64')
url="https://codeberg.org/ivanv444/mmntfetch"
license=('MIT')
depends=('curl')
makedepends=('git' 'gcc')
provides=('mamofetch')
conflicts=('mamofetch')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  g++ mfetch.cpp -o mamofetch
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 mamofetch "${pkgdir}/usr/bin/mamofetch"
}