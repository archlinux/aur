# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=slidev-cli
pkgver=0.40.2
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz")
sha512sums=('72a6ef352efc2132977593e0aa154d013bbec9ed2c8809bb506dd498acae6eb089b1e018cba52e45bd74f62ddc290f6081feea9513d89fd6daa5ed8c0c4108a2')

package() {
	npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

	cd "$pkgdir/usr"

	find . -exec chown -h 0:0 {} +
	find . -type d -exec chmod 755 {} +

	install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
