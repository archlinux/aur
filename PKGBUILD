# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>
# Contributor: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=chromium-runner
pkgver=0.0.1
pkgrel=1
pkgdesc="Run a Chromium profile or application"
arch=(any)
url="https://github.com/synaptiko/chromium-runner"
license=('BSD')
depends=('chromium' 'fzf' 'nodejs' 'npm')
provides=('chromium-runner')
source=('https://github.com/synaptiko/chromium-runner/archive/v0.0.1.tar.gz')
sha256sums=('5e4bbfaf40b06380c06e176c781e29a04f9756821d74f97d9bf990bdc8c25154')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/v$pkgver.tar.gz"
	chmod -R go-w "$pkgdir"/usr
}
