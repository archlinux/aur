# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=slidev-cli
pkgver=0.43.2
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz")
sha512sums=('be5a6702280d18b072943f9d6835d6cda9898e0135b31e95b6dcb2468f496fc3333e8a5f2c847f36943e65a87faf8c0c1f9235676d97b6ee4de98b526322c0bd')

package() {
	npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

	cd "$pkgdir/usr"

	find . -exec chown -h 0:0 {} +
	find . -type d -exec chmod 755 {} +

	install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
