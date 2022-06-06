
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=heliocron-bin
_pkgname=${pkgname%-*}
pkgver=0.6.0
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other solar events.'
arch=('x86_64')
url='https://github.com/mfreeborn/heliocron'
license=('Apache' 'MIT')
provides=('heliocron')
conflicts=('heliocron-git')
source=("https://github.com/mfreeborn/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a48daccda9d1c9fcb71fe6334c54e765c8d71dfa7bd00ed74ed067645a8ff20e')

package() {
	cd "$srcdir/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
	install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}

