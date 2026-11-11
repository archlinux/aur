# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock-bin
_pkgname=astra-airlock
pkgver=2.0.0
pkgrel=1
pkgdesc='A beautiful m3expressive greetd frontend based on Caelestia (prebuilt binary)'
arch=('x86_64')
url='https://github.com/AstraSuite/Airlock'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'greetd'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-m3shapes-git'
)
optdepends=(
	'caelestia-cli: dynamic color scheme syncing with Caelestia'
	'cage: kiosk compositor, if not using Hyprland'
	'hyprland: kiosk compositor, if not using Cage'
	'wlr-randr: the monitor flags'
)
provides=('astra-airlock')
conflicts=('astra-airlock' 'astra-airlock-git')
options=('!strip' '!debug')
install=astra-airlock.install
source=(
	"${_pkgname}-v${pkgver}::https://github.com/AstraSuite/Airlock/releases/download/v${pkgver}/${_pkgname}-v${pkgver}"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/AstraSuite/Airlock/v${pkgver}/LICENSE"
)
sha256sums=('076a0fff70fec34c5ade30e5194a1e3ec06580050f19bd526856ae41bbd0b919'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/astra-airlock"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
