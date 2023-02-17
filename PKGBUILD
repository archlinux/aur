# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=helixbinhx
pkgver=2
pkgrel=1
pkgdesc='Link /usr/bin/hx to helix'
arch=(any)
license=('GPL')
depends=()
depends=(helix)
conflicts=(hex)
source=()
sha256sums=()

package() {
	install -dm755 "$pkgdir/usr/bin"
	ln -s helix "$pkgdir/usr/bin/hx"

	install -Dm 644 "/usr/share/bash-completion/completions/helix" \
		"$pkgdir/usr/share/bash-completion/completions/hx"
	sed -i 's/helix/hx/g' "$pkgdir/usr/share/bash-completion/completions/hx"

	install -Dm 644 "/usr/share/fish/vendor_completions.d/helix.fish" \
		"$pkgdir/usr/share/fish/vendor_completions.d/hx.fish"
	sed -i 's/helix/hx/g' \
		"$pkgdir/usr/share/fish/vendor_completions.d/hx.fish"

	install -Dm 644 "/usr/share/zsh/site-functions/_helix" \
		"$pkgdir/usr/share/zsh/site-functions/_hx"
	sed -i 's/helix/hx/g' "$pkgdir/usr/share/zsh/site-functions/_hx"
}
