# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=pacman-cache-server-git
pkgver=7.344299c
pkgrel=1
pkgdesc="Caching pacman mirror for faster downloads at home"
arch=('any')
url=https://github.com/antonilol/pacman-cache-server
license=('MIT')
source=("pacman-cache-server::git+$url")
md5sums=('SKIP')
depends=('nodejs' 'npm')
makedepends=('git')

build() {
  cd "$srcdir/pacman-cache-server"
  npm i
  npm run build
}

package() {
  cd "$pkgdir"
  mkdir -p usr/{bin,lib}
  cp -r "$srcdir"/pacman-cache-server usr/lib/"$pkgname"
}
