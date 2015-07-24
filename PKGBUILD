# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=hardcode-fixer-git
pkgver=v0.8.2.r10.g58a4851
pkgrel=1
pkgdesc="Fixes Hardcoded Icons"
arch=('i686' 'x86_64')
url="https://github.com/Foggalong/hardcode-fixer"
license=('GPL')
#depends=('pacman' 'curl')
makedepends=('git')
source=("$pkgname"::'git://github.com/Foggalong/hardcode-fixer.git')
#source=('git+https://github.com/Foggalong/hardcode-fixer.git'
#source=('git+https://github.com/Foggalong/hardcode-fixer.git#branch=master'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/fix.sh" "$pkgdir/usr/bin/hardcode-fixer"
}
