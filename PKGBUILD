# Maintainer: ivan4 <твоя_почта>
pkgname=mmntfetch-git
_pkgname=mmntfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple system fetch tool written in C++"
arch=('x86_64')
url="https://codeberg.org/ivanv444/mmntfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'gcc')
provides=('mamofetch-git')
conflicts=('mamofetch-git')
source=("git+https://codeberg.org/ivanv444/mmntfetch.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  g++ mfetch.cpp -o mmntfetch
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 mmntfetch "${pkgdir}/usr/bin/mmntfetch"
}