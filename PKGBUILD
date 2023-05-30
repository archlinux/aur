# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=slidev-cli
pkgver=0.42.1
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz")
sha512sums=('385df74aa2f1b534a87a87668ff477ef277fdeae282188186ba28e20a8414445cc7e9e40f0204da7b1c90927d4fc6361052e695359d2c55a50c3884a6e4e0421')

package() {
	npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

	cd "$pkgdir/usr"

	find . -exec chown -h 0:0 {} +
	find . -type d -exec chmod 755 {} +

	install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
