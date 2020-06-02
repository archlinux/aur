# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-keepassxc
pkgver=1.3
pkgrel=1
pkgdesc="Simple keepassxc-cli frontend in rofi"
arch=('any')
url="https://github.com/samedamci/${pkgname}"
license=('MIT')
depends=('rofi' 'xclip' 'keepassxc' 'zsh')
makedepends=()
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('29e2a246546850d309478bde719d625c9a92834cb79659fe7fab0dc53cc4f5ab645352717c82bc5d6fd7c550e98193a32dfe9769090274eb909fff2de8d909ae')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-keepassxc" "$pkgdir/usr/bin/${pkgname}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
