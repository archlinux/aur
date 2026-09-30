# Maintainer: AceMinerOjal <ojalkhatiwada6c@gmail.com>

pkgname=ztrash
pkgver=1.1.0
pkgrel=1
pkgdesc="A polished, FreeDesktop-compliant trash manager with fzf integration, live watcher, and pattern restore"
arch=('any')
url="https://github.com/AceMinerOjal/ztrash"
license=('MIT')
depends=('zsh' 'coreutils')
makedepends=('scdoc')
optdepends=('fzf: fuzzy-find integration with --fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AceMinerOjal/ztrash/archive/v$pkgver.tar.gz")
sha256sums=('fa3045330c20ba8cb8199cbdaacd98e865b2d0ad36805ecaf9c9d0624cbdaa9f')
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
