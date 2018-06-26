# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.5.1
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel dnsutils dnsmasq geoip geoip-database python-psutil python-requests python-lxml python-beautifulsoup4 python-pycountry python-pexpect libcgroup)
makedepends=(python-setuptools)
install=
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("94a97623dfa77006e9c1bc73587fab40180d175de529936aa60d8a1cfd832734")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


