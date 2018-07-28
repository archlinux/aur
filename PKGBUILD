# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.6.2
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip geoip-database python-psutil python-requests python-lxml python-beautifulsoup4 python-pycountry python-pexpect libcgroup wireguard-tools)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("7c45d5e2fdf46dd67f31fb809bb71c097cde5d7d7f06b5d55437bbb0a55a8b74")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


