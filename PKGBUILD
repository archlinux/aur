# Maintainer: Andrej Radović (r.andrej@gmail.com)

pkgname=korg-nanokontrol-studio-autoconnect
pkgver=1.0.0
pkgrel=1
pkgdesc="Auto-connect Korg Nanokontrol Studio via Bluetooth to virtual MIDI through ALSA"
arch=('any')
url="https://aur.archlinux.org/packages/korg-nanokontrol-studio-autoconnect"
license=('GPL3')
depends=('bluez' 'bluez-utils' 'alsa-utils' 'kmod')
source=('korg-nanokontrol-connect.sh'
    '99-korg-nanokontrol-studio.rules')
sha256sums=('SKIP' 'SKIP')

package() {
    # Install the connection script
    install -Dm755 "$srcdir/korg-nanokontrol-connect.sh" "$pkgdir/usr/bin/korg-nanokontrol-connect.sh"

    # Install the udev rule
    install -Dm644 "$srcdir/99-korg-nanokontrol-studio.rules" "$pkgdir/usr/lib/udev/rules.d/99-korg-nanokontrol-studio.rules"
}
