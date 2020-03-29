# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-keepassxc
pkgver=1.1
pkgrel=1
pkgdesc="Simple keepassxc-cli frontent in rofi"
arch=('any')
url="https://github.com/samedamci/${pkgname}"
license=('MIT')
depends=('rofi' 'xclip' 'keepassxc' 'zsh')
makedepends=()
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('23c1e61d3582411567b9bca2e866ecc01b0ae17d70be7e5f6d4c2b8926f924f7bc2fc86e2a42c7131e3208bb8b5335abe72c31dee83afb55c3cc7f4f113f1b70')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-keepassxc" "$pkgdir/usr/bin/${pkgname}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
