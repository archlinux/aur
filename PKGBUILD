# Maintainer:
# Co-Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=steamtinkerlaunch
pkgver=12.12
pkgrel=1
pkgdesc="Wrapper script for Steam custom launch options"
arch=('any')
url="https://github.com/sonic2kk/steamtinkerlaunch"
license=('GPL3')
depends=('bash' 'git' 'procps-ng' 'unzip' 'xxd' 'wget' 'xdotool' 'xorg-xprop' 'xorg-xrandr' 'xorg-xwininfo' 'yad')
optdepends=(
	'boxtron: for optional Boxtron support'
	'gamemode: for using GameMode per game'
	'gamescope: for optional GameScope support'
	'gdb: optional for starting the game under the debugger gdb'
	'imagemagick: optional to scale a custom installed game header picture and for converting game icons'
	'innoextract: optional for extracting the Cheat Engine setup archive'
	'jq: optional for extracting game names from the steam api'
	'libnotify: for optional Notifier'
	'mangohud: for using MangoHUD per game'
	'net-tools: for optional network monitoring'
	'nyrna: for using Nyrna per game'
	'p7zip: optional for extracting SpecialK archives'
	'pev: optional for extracting data from the game exe'
	'replay-sorcery: for using Replay-Sorcery per game'
	'rsync: optional for backing up steamuser files from proton games'
	'scummvm: for optional ScummVM support via Roberta'
	'strace: write a strace log of the launched game'
	'usbutils: optional for a quick VR HMD presence check'
	'vkbasalt: for using vkBasalt per game'
	'vr-video-player: for playing regular games side-by-side in VR'
	'wine: for optional wine support'
	'winetricks: winetricks support'
	'xdg-utils: optional for opening game paths'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b81b9fc1fe7b87ccd9f62b074ea1e09ce245b42c13b7e009e832272459e3a555')

package() {
	cd "$srcdir/$pkgname-${pkgver}"
	install -Dm755 "${pkgname}" -t "$pkgdir/usr/bin"

	install -d "$pkgdir/usr/share/${pkgname}"
	cp -r collections eval guicfgs lang misc "$pkgdir/usr/share/${pkgname}"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "misc/${pkgname}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "misc/${pkgname}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
