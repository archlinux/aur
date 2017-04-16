# Maintainer: Reto Brunner <brunnre8@gmail.com>
pkgname=networkd-notify-git
pkgver=r6.989affa
pkgrel=2
pkgdesc='Desktop notification integration for systemd-networkd'
arch=('any')
url='https://github.com/wavexx/networkd-notify'
license=('GPL3')
depends=('python' 'python-gobject' 'python-dbus' 'wireless_tools')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/wavexx/networkd-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
package() {
	cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "networkd-notify" "$pkgdir/usr/bin/networkd-notify"
}
