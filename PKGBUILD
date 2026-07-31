pkgname=nosleep
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple script to keep your Linux system awake"
arch=('any')
url="https://github.com/Naiko8642/nosleep"
license=('MIT')
depends=('bash' 'systemd')
optdepends=(
  'libnotify: For desktop notifications'
  'xorg-xprintidle: For X11 idle time monitoring'
  'xdotool: For window title checks'
  'xorg-xprop: For root window property checks'
  'xorg-xrandr: For external monitor checks'
  'pulseaudio: For audio playback checks'
  'bluez-utils: For Bluetooth device checks'
  'smartmontools: For disk SMART temperature monitoring'
  'iproute2: For network interface checks'
  'sysstat: For system statistics'
  'curl: For HTTP status checks'
  'wget: For HTTP status checks fallback'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Naiko8642/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eee62d3be0076480f136531625fe1aad0be5d7eacdc4b40a477cb2b16c4c2af4')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 nosleep.sh "${pkgdir}/usr/bin/nosleep"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
