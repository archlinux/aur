# Maintainer: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.8.2
pkgrel=1
pkgdesc="OpenVPN Gui with advanced features and support for multiple providers"
arch=("x86_64")
url="https://github.com/corrad1nho/qomui"
license=("GPL3")
depends=(python python-pyqt5 python-dbus openvpn stunnel bind-tools dnsmasq geoip python-psutil python-requests python-lxml python-beautifulsoup4 python-pexpect libcgroup wireguard-tools python-cryptography)
makedepends=(python-setuptools)
install=qomui.install
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("78187864a4368fed06f6e58c4d411053a1d1193d625ee79be0a57bf0938b1d0b")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root "$pkgdir/"
	echo -e "$pkgver\nAUR" > $pkgdir/usr/share/qomui/VERSION
}


