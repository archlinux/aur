# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=pdfrankenstein
pkgver=1
pkgrel=1
pkgdesc="PDF Annotator of Nightmares"
url="https://github.com/oxplot/$pkgname"
arch=("x86_64")
license=("BSD")
makedepends=("go>=1.18" "git")
depends=("inkscape" "qpdf" "poppler")
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
	install -Dm0644 ${pkgname}.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm0644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

