# Maintainer: Vivian Szczepanski <warbler at disroot dot org>
pkgname=schwa
pkgver=0.1.1
pkgrel=1
pkgdesc='Interactively select and watch shows'
arch=('any')
url='https://git.sr.ht/~warbler/schwa'
license=('AGPL')
depends=('sed' 'sh')
optdepends=('xdg-user-dirs: XDG directory support'
	    'xdg-utils: xdg-open support')
source=("$pkgname-$pkgver.tar.gz::http://git.sr.ht/~warbler/$pkgname/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.sig")
sha256sums=('b82c962a72772e7830de85f12d7ff5072e231945653e80cd4f30d18d6c4547be'
            'SKIP')
validpgpkeys=('7C8B14044604CE5FD5A6FC426E48F61E93D1E300')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 schwa.sh "$pkgdir/usr/bin/schwa"
	install -Dm644 schwa.1 "$pkgdir/usr/share/man/man1/schwa.1"
}
