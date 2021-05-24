# Maintainer: BeyondMagic <koetemagie@gmail.com>
pkgname=nincat-git
pkgver=2.9.r83.afd6520.r83.afd6520
pkgrel=1
pkgdesc="This a simple script that loads an ASCII art centered in your terminal."
arch=(any)
url="https://github.com/BeyondMagic/nincat"
license=('GPL3')
makedepends=(git)
checkdepends=(coreutils)
optdepends=(c-lolcat)
provides=(nincat)
conflicts=(nincat)
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd nincat-git
  printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd nincat-git
  install -d $pkgdir/usr/bin
  make DESTDIR="$pkgdir/usr/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
