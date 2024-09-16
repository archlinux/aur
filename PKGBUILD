# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=zpotify
pkgver=0.2.2
pkgrel=1
pkgdesc="A CLI for Spotify"
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$pkgname"
license=('GPL-3.0')
depends=('libjpeg' 'chafa')
makedepends=('zig')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/$pkgver/$pkgname.tar.gz")
sha256sums=('8e598963d0d6c17aa1666be207afe152cd3a95810ad58b3c3c5df16c672d1eda')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Doptimize=ReleaseFast -p "$pkgdir/usr"
	install -Dm644 "_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
