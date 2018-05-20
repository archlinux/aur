# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>
# Contributor: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=chromium-runner
pkgver=0.2.0
pkgrel=1
pkgdesc="Run a Chromium profile"
arch=(any)
url="https://github.com/synaptiko/chromium-runner"
license=('BSD')
depends=('chromium' 'fzf' 'nodejs' 'npm')
provides=('chromium-runner' 'chromium-runner-rofi')
source=("https://github.com/synaptiko/chromium-runner/archive/v${pkgver}.tar.gz")
sha256sums=('48f02fbbed07343bacd5668bc7ee0c42a45df37a592236754a1d0a2593b6609b')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/v$pkgver.tar.gz"
	chmod -R go-w "$pkgdir"/usr
}
