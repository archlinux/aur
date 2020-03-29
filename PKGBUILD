# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-keepassxc
pkgver=1.2
pkgrel=1
pkgdesc="Simple keepassxc-cli frontend in rofi"
arch=('any')
url="https://github.com/samedamci/${pkgname}"
license=('MIT')
depends=('rofi' 'xclip' 'keepassxc' 'zsh')
makedepends=()
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('33d1bf21fab4c25dd9f30ae500bfac74eaae33d3959c3f6c9bcd540ce09bbe8655ad3930a46c9287dd92ce08090e772917c5603c99d3af9683f9545265c3e464')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-keepassxc" "$pkgdir/usr/bin/${pkgname}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
