# Maintainer: AceMinerOjal <ojalkhatiwada6c@gmail.com>

pkgname=ztrash
pkgver=1.0.0
pkgrel=1
pkgdesc="A polished, FreeDesktop-compliant trash manager with fzf integration, live watcher, and pattern restore"
arch=('any')
url="https://github.com/AceMinerOjal/ztrash"
license=('MIT')
depends=('zsh' 'coreutils')
makedepends=('scdoc')
optdepends=('python: URL encoding/decoding fallback'
	'fzf: fuzzy-find integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AceMinerOjal/ztrash/archive/v$pkgver.tar.gz")
sha256sums=('99b667572658065cce3fe74e633a82a7d0ab014c8ddcabf8cd5d8b6087d77575')
install=ztrash.install

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 ztrash "$pkgdir/usr/bin/ztrash"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 completions/ztrash.bash "$pkgdir/usr/share/bash-completion/completions/ztrash"
	install -Dm644 completions/ztrash.zsh "$pkgdir/usr/share/zsh/site-functions/_ztrash"
	install -Dm644 completions/ztrash.fish "$pkgdir/usr/share/fish/vendor_completions.d/ztrash.fish"

	scdoc <doc/ztrash.1.scd >ztrash.1
	install -Dm644 ztrash.1 "$pkgdir/usr/share/man/man1/ztrash.1"
}
