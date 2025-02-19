pkgname=notion-calendar-widget
pkgver=1.0.0
pkgrel=1
pkgdesc="A widget window that displays notion calendar as a compact sidebar, that also responds to PYWAL themes."
arch=('any')
url="https://github.com/meeplabsdev/notion-calendar-widget"
licence=('MIT')
depends=()
makedepends=('npm' 'nodejs')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	npm install
	npm run package
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r out/notion-calendar-widget-*/* "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/$pkgname/notion-calendar-widget" "$pkgdir/usr/bin/notion-calendar-widget"
}
