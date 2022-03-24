# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=pdfrankenstein
pkgver=0.4
pkgrel=1
pkgdesc="PDF Annotator of Nightmares"
url="https://github.com/oxplot/$pkgname"
arch=("x86_64")
license=("BSD")
makedepends=("go>=1.18" "git")
depends=("inkscape")
source=("git+https://github.com/oxplot/$pkgname#tag=v$pkgver")
sha512sums=('SKIP')

build() {
	cd "$pkgname"
  go build -o $pkgname
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

