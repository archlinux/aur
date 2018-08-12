# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.6.4
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip geoip-database python-psutil python-requests python-lxml python-beautifulsoup4 python-pycountry python-pexpect libcgroup wireguard-tools)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("1a35f2bce0ba60ef8f4debd283c4836799d28310494abc7d439457a05437704c")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


