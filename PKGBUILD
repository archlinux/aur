pkgname=tuxpit-kneeboard
pkgver=1.0.0
pkgrel=1
pkgdesc="Kneeboard overlay for Digital Combat Simulator made with golang and qt6."
arch=('x86_64')
url="https://github.com/Kam1ni/tuxpit-kneeboard"
license=('MIT')
dependes=('qt6-base' 'ttf-nerd-fonts-symbols')
makedepends=('go' 'git' 'pkgconf' 'qt6-base')
source=("git+https://github.com/Kam1ni/tuxpit-kneeboard.git#tag=v$pkgver")
sha256sums=('SKIP')
optdepends=('ttf-dejavu: fallback font if no system font available')

build() {
	cd "$srcdir/tuxpit-kneeboard/src"
	go build -v -ldflags "-s -w" -o "$pkgname"
}

package() {
	cd "$srcdir/tuxpit-kneeboard"

	install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}

