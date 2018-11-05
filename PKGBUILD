# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Jacob Juric <jacobjuric1@gmail.com>

pkgname=gwen-web
pkgver=2.26.4
pkgrel=1
pkgdesc="A web automation engine for the Gwen interpreter."
arch=('any')
url="https://github.com/gwen-interpreter/gwen-web"
license=('Apache')
depends=('java-runtime=8')
optdepends=('chromedriver: Google Chrome support (AUR)'
            'geckodriver: Firefox support')
source=("https://github.com/gwen-interpreter/gwen-web/releases/download/v$pkgver/$pkgname-$pkgver.zip")
sha256sums=('a162ba27e609e4153816aa73bdce7e3cf32c69ff5c2bf926dd957a51f886a36a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/gwen "${pkgdir}/opt/gwen-web/bin/gwen"
	install -Dm755 bin/gwen-web "${pkgdir}/opt/gwen-web/bin/gwen-web"
	install -Dm755 gwen "${pkgdir}/opt/gwen-web/gwen"
	install -Dm644 CHANGELOG.txt "${pkgdir}/opt/gwen-web/CHANGELOG"
	install -Dm644 LICENSE.txt "${pkgdir}/opt/gwen-web/LICENSE"
	install -Dm644 LICENSE-THIRDPARTY.txt "${pkgdir}/opt/gwen-web/LICENSE-THIRDPARTY"
	install -Dm644 NOTICE.txt "${pkgdir}/opt/gwen-web/NOTICE"
	cp -r lib "${pkgdir}/opt/gwen-web"
        cp -r features "${pkgdir}/opt/gwen-web"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/gwen-web/bin/gwen "${pkgdir}/usr/bin/gwen"
	ln -s /opt/gwen-web/bin/gwen-web "${pkgdir}/usr/bin/gwen-web"
}
