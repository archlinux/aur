# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.8.1
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip python-psutil python-requests python-lxml python-beautifulsoup4 python-pexpect libcgroup wireguard-tools python-cryptography)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("fad07e6f7d33c110b43d356ae3d9363a2c0a4dd8b10a00ef91d015871d23116c")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


