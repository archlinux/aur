# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
# Co-Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=steamtinkerlaunch
pkgver=6.13
pkgrel=1
pkgdesc="Wrapper script for Steam custom launch options"
arch=('any')
url="https://github.com/frostworx/steamtinkerlaunch"
license=('GPL3')
depends=('bash' 'git' 'procps-ng' 'unzip' 'wget' 'which' 'xdotool' 'xorg-xprop' 'xorg-xrandr' 'xorg-xwininfo' 'yad')
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
    'wine: for optional Vortex Mod Manager support'
    'gameconqueror: for optional cheating'
    'gamescope: for optional GameScope support'
    'libnotify: for optional Notifier'
    'cabextract: optional for extracting the wmp10 setup archive'
    'innoextract: optional for extracting the Cheat Engine setup archive'
    'usbutils: optional for a quick VR HMD presence check'
    'jq: optional for extracting game names from the steam api and for sorting available Lutris Wine Versions'
    'rsync: optional for backing up steamuser files from proton games'
    'openssl: optional for generating a random hex string for Non-Steam games'
	'imagemagick: optional to scale a custom installed game header picture and for converting game icons'
	'appinfo-vdf: optional for converting the binary appinfo.vdf into a parsable format'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c9697ee2cfa264e5c292cb935f9f3b2e3c4dbff64f086955770a323a45f7082')

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 stl -t "$pkgdir/usr/bin"

    install -d "$pkgdir/usr/share/stl"
    cp -r categories eval guicfgs lang misc regs reshadepresets "$pkgdir/usr/share/stl"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
