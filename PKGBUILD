# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-keepassxc
pkgver=1.4
pkgrel=2
pkgdesc="Simple keepassxc-cli frontend in rofi"
arch=('any')
url="https://github.com/samedamci/${pkgname}"
license=('ISC')
depends=('rofi' 'xclip' 'keepassxc')
makedepends=()
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ce0d756f0b89dd4752e854f629b5dd146bd5e3afc5157c4487249be7a31972b0e2225f3ed80d6a11061d7fba1f8e0e93e282db872e280c028249a0553f8f617b')

package() {
	cd "$pkgname-$pkgver" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-keepassxc" "$pkgdir/usr/bin/${pkgname}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
