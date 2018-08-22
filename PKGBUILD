# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.7.2
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip python-psutil python-requests python-lxml python-beautifulsoup4 python-pexpect libcgroup wireguard-tools)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("10737ac1f5212cd56643e6ccf2209899d9e6af3a82d5bda09cbab0b7aa05537c")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


