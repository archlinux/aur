pkgname=arch-os-manager
pkgver=1.9.0
pkgrel=2
pkgdesc="Arch OS System Manager"
arch=('any')
url="https://github.com/murkl/arch-os-manager"
license=('Apache-2.0')
depends=('base-devel' 'pacman-contrib')
optdepends=(
	'ttf-firacode-nerd: Install and set font icons that are used to display information'
	'libnotify: Add notification support'
	'paru: Add support for AUR packages'
	'flatpak: Add support for Flatpak packages'
	'xdg-utils: Add support for open news in browser'
	'reflector: Add support for refresh mirrorlist'
	'meld: Add support for merge pacdiff configurations'
	'downgrade: Add support for donwgrade system packages'
)
source=("https://github.com/murkl/arch-os-manager/releases/download/$pkgver/arch-os" "https://raw.githubusercontent.com/murkl/arch-os-manager/refs/heads/main/docs/logo.svg" "arch-os.desktop")
sha256sums=('20b3c07c5053678683ca99b42f927896920a770a836e361506394904cf8af529' 'SKIP' 'SKIP')

package() {
	install -Dm755 "$srcdir/arch-os" "$pkgdir/usr/bin/arch-os"
	install -Dm644 "$srcdir/arch-os.desktop" "$pkgdir/usr/share/applications/arch-os.desktop"
	install -dm755 "$pkgdir/opt/arch-os-manager"
	install -Dm644 "$srcdir/logo.svg" "$pkgdir/opt/arch-os-manager/logo.svg"
}
