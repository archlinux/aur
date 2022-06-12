
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=heliocron-bin
_pkgname=${pkgname%-*}
pkgver=0.6.1
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other solar events.'
arch=('x86_64')
url='https://github.com/mfreeborn/heliocron'
license=('Apache' 'MIT')
provides=('heliocron')
conflicts=('heliocron-git')
source=("https://github.com/mfreeborn/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5b7c8b24e4a14da44b5a26bbfe4921a47dfc144a3ea6e73820259efdd3f4b465')

package() {
	cd "$srcdir"
	install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}

