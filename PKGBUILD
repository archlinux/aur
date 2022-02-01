# Maintainer: Michael Heap <m@michaelheap.com>
pkgname=git-rook
pkgver=0.0.1
pkgrel=1
pkgdesc="A git hook runner that can be used to execute multiple hooks in a git repository."
arch=('any')
url="https://github.com/mtdowling/git-rook"
license=('MIT')
depends=('git')
source=("$pkgname-$pkgver::https://github.com/mtdowling/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bc1bdea1c9a9d6e4b104294f4527ef705080cc821b1e0ff5df025ba3e1d30a2a')

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 git-rook "$pkgdir/usr/bin/git-rook"
	install -Dm644 git-rook.1 "$pkgdir/usr/share/man/man1/git-rook.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
