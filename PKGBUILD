# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.7.3
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip python-psutil python-requests python-lxml python-beautifulsoup4 python-pexpect libcgroup wireguard-tools)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("e2a9c902fc4aa456a50b3de2cae121b401780499d551bb0e1ccecde7e3ac38ea")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


