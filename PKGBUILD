# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>
# Contributor: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=chromium-runner
pkgver=0.1.0
pkgrel=1
pkgdesc="Run a Chromium profile or application"
arch=(any)
url="https://github.com/synaptiko/chromium-runner"
license=('BSD')
depends=('chromium' 'fzf' 'nodejs' 'npm')
provides=('chromium-runner' 'chromium-runner-rofi')
source=("https://github.com/synaptiko/chromium-runner/archive/v${pkgver}.tar.gz")
sha256sums=('eff74856154ad87e761268801b0479670e68fb2d43a1fc497783d659bedafd73')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/v$pkgver.tar.gz"
	chmod -R go-w "$pkgdir"/usr
}
