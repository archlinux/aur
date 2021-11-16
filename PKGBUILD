# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=slidev-cli
pkgver=0.27.15
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz")
sha512sums=('236d1fd2d7bd900c9d95dbac131bd7dfb4612a0f1863ca936443f15550fe6cdf0b6e8fb647aefc464312390e741261d15afeb5ef7117db7aeb8a03e53b26d7dd')

package() {
	npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

	cd "$pkgdir/usr"

	find . -exec chown -h 0:0 {} +
	find . -type d -exec chmod 755 {} +

	install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
