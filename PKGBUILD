# Maintainer: fearlessdots <filipebertelli@tutanota.com>

pkgname=sharik-bin
pkgver=3.1
pkgrel=4
pkgdesc="Sharik is an open-source, cross-platform solution for sharing files via Wi-Fi or Mobile Hotspot"
arch=('x86_64')
url="https://github.com/marchellodev/sharik"
license=('MIT')
depends=('gtk3')
source=(
	"https://github.com/marchellodev/sharik/releases/download/v${pkgver}/sharik_v${pkgver}_linux.deb"
	"https://raw.githubusercontent.com/marchellodev/sharik/master/assets/logo.svg"
)
sha256sums=('0eacc28d2dc98e0ae9d400aa80d0df412c3b66225b8e624da047c548bb279713'
            'f03612a7314738d9dd84523da4e7198e4bf9f83100df1879e0c3cb0425201275')

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

	# Fix permissions
	chown -R root:root "$pkgdir/"

	# Install icon
	install -Dm644 "logo.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/sharik.svg"
}
