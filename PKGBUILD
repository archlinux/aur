# Maintainer: Jacob Juric <jacobjuric1@gmail.com>

pkgname=gwen-web
pkgver=2.6.0
pkgrel=1
pkgdesc="A web automation engine for the Gwen interpreter."
arch=('any')
url="https://github.com/gwen-interpreter/gwen-web"
license=('Apache')
depends=('java-runtime=8')
optdepends=('chromedriver: Google Chrome support (AUR)'
            'geckodriver: Firefox support')
source=("https://github.com/gwen-interpreter/gwen-web/releases/download/v$pkgver/$pkgname-$pkgver.zip")
sha256sums=('08a40d9346b049430678c522e48c27fa2d7e311067192b1e5e6bd0fef69750e2')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/gwen $pkgdir/opt/gwen-web/bin/gwen
	install -Dm755 bin/gwen-web $pkgdir/opt/gwen-web/bin/gwen-web
	install -Dm755 gwen $pkgdir/opt/gwen-web/gwen
	install -Dm644 CHANGELOG $pkgdir/opt/gwen-web/CHANGELOG
	install -Dm644 LICENSE $pkgdir/opt/gwen-web/LICENSE
	install -Dm644 LICENSE-THIRDPARTY $pkgdir/opt/gwen-web/LICENSE-THIRDPARTY
	install -Dm644 NOTICE $pkgdir/opt/gwen-web/NOTICE
	cp -r lib $pkgdir/opt/gwen-web
        cp -r features $pkgdir/opt/gwen-web
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/gwen-web/bin/gwen $pkgdir/usr/bin/gwen
	ln -s /opt/gwen-web/bin/gwen-web $pkgdir/usr/bin/gwen-web
}
