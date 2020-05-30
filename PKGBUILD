# Contributor: kinru <kinru at protonmail dot com>
pkgname=wifipumpkin3
pkgver=v1.0.0.R5.r20.g763017b
pkgrel=3
pkgdesc="Framework for Rogue Wi-Fi Access Point Attacks"
arch=('x86_64')
url="https://github.com/P0cL4bs/wifipumpkin3"
license=('Apache')
depends=('openssl' 'python>=3.0.0' 'libffi' 'python-pyqt5' 'hostapd' 'iptables' 'iw' 'net-tools' 'wireless_tools' 'python-setuptools' 'python-pip' )
makedepends=('git')
source=("git+https://github.com/P0cL4bs/wifipumpkin3.git/")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build	
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

