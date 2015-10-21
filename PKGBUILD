## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
pkgdesc="Steam wrapper for common operations"
pkgver=0.1.9
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support' \
        'steam-libs: Native steam libraries support')
depends=('steam' 'bash' 'coreutils' 'findutils')
makedepends=()
provides=('steam-wrapper')
conflicts=('steam-wrapper')
license=('GPLv2')
url="https://github.com/pyamsoft/${pkgname}/archive/${pkgver}.tar.gz"
source=("$url")
sha256sums=('fc196dc9057a2959e63354707a5310c993f083c5fc112e5d5cc66cec86fbb6b4')

package() {
	cd "$srcdir"/"$pkgname-$pkgver"

	# Install the script
	install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install the desktop file
	install -Dm644 "${pkgname}.desktop" \
                "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Install the default configuration
	install -Dm 644 "${pkgname}.conf" \
                "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}

