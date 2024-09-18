# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=zpotify
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI for Spotify"
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$pkgname"
license=('GPL-3.0')
depends=('libjpeg' 'chafa')
makedepends=('zig')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6d40b97b37bdfaeb7c5273e47af8e1062c238696d26d7deef9ef2f12af429098')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Doptimize=ReleaseFast -p "$pkgdir/usr"
	install -Dm644 "_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
