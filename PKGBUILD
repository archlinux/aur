# Maintainer: Vivian Szczepanski <warbler at disroot dot org>
pkgname=schwa
pkgver=0.1.1
pkgrel=2
pkgdesc='Interactively select and watch shows'
arch=('any')
url='https://git.sr.ht/~warbler/schwa'
license=('AGPL')
depends=('sed' 'sh')
optdepends=('xdg-user-dirs: XDG directory support'
	    'xdg-utils: xdg-open support')
source=("$pkgname-$pkgver.tar.gz::http://git.sr.ht/~warbler/$pkgname/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.sig")
sha256sums=('24cf638ac6d0bf112e37d70a5212ff4005cba8aa43a36c40799f923eacbd0c2e'
            'SKIP')
validpgpkeys=('7C8B14044604CE5FD5A6FC426E48F61E93D1E300')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 schwa.sh "$pkgdir/usr/bin/schwa"
	install -Dm644 schwa.1 "$pkgdir/usr/share/man/man1/schwa.1"
}
