# Maintainer:
# Co-Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=steamtinkerlaunch
pkgver=12.0
pkgrel=1
pkgdesc="Wrapper script for Steam custom launch options"
arch=('any')
url="https://github.com/sonic2kk/steamtinkerlaunch"
license=('GPL3')
depends=('bash' 'git' 'procps-ng' 'unzip' 'xxd' 'wget' 'xdotool' 'xorg-xprop' 'xorg-xrandr' 'xorg-xwininfo' 'yad')
optdepends=(
	'strace: write a strace log of the launched game'
	'gamemode: for using GameMode per game'
	'mangohud: for using MangoHUD per game'
	'vkbasalt: for using vkBasalt per game'
	'winetricks: winetricks support'
	'vr-video-player: for playing regular games side-by-side in VR'
	'nyrna: for using Nyrna per game'
	'replay-sorcery: for using Replay-Sorcery per game'
	'net-tools: for optional network monitoring'
	'boxtron: for optional Boxtron support'
	'scummvm: for optional ScummVM support via Roberta'
	'wine: for optional wine support'
	'gameconqueror: for optional cheating'
	'gamescope: for optional GameScope support'
	'libnotify: for optional Notifier'
	'innoextract: optional for extracting the Cheat Engine setup archive'
	'usbutils: optional for a quick VR HMD presence check'
	'jq: optional for extracting game names from the steam api'
	'rsync: optional for backing up steamuser files from proton games'
	'imagemagick: optional to scale a custom installed game header picture and for converting game icons'
	'p7zip: optional for extracting SpecialK archives'
	'pev: optional for extracting data from the game exe'
	'gdb: optional for starting the game under the debugger gdb'
	'xdg-utils: optional for opening game paths'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c20dabbf08722a3da207e6b5eaf515b5ca76c25138345940df689d5250c60e04')

package() {
	cd "$srcdir/$pkgname-${pkgver}"
	install -Dm755 "${pkgname}" -t "$pkgdir/usr/bin"

	install -d "$pkgdir/usr/share/${pkgname}"
	cp -r collections eval guicfgs lang misc "$pkgdir/usr/share/${pkgname}"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "misc/${pkgname}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "misc/${pkgname}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
