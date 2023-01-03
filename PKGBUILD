# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=slidev-cli
pkgver=0.38.2
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz")
sha512sums=('e128767da78caa2be05a2085b86b5645f9db288549ffb740f56cff9130888acd4cda8905f80110c963350aeba69b007f292d9d8827a8edf0b90b8a0fa9c28982')

package() {
	npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

	cd "$pkgdir/usr"

	find . -exec chown -h 0:0 {} +
	find . -type d -exec chmod 755 {} +

	install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
