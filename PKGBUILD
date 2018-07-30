# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.6.3
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip geoip-database python-psutil python-requests python-lxml python-beautifulsoup4 python-pycountry python-pexpect libcgroup wireguard-tools)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("3ad282d26e62c1eb8d89ce544eabd3b01d09255fe031f8e01a3be4d3f0172ccf")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


