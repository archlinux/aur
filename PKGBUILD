# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=pdftilecut
pkgver=0.6
pkgrel=1
pkgdesc="pdftilecut lets you sub-divide a PDF page(s) into smaller pages"
url="https://github.com/oxplot/pdftilecut"
arch=("x86_64")
license=("BSD")
makedepends=("go>=1.18" "git" "yasm" "cmake" "coreutils")
depends=()
source=("git+https://github.com/oxplot/pdftilecut#tag=v$pkgver")
sha512sums=('SKIP')

build() {
	cd "$pkgname"
  make
}

package() {
	cd "$pkgname"
	install -Dm755 bin/pdftilecut "$pkgdir/usr/bin/pdftilecut"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
