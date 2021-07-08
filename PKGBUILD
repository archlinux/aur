# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cast_control
pkgver=0.11.4
pkgrel=1
pkgdesc="Control Chromecasts from Linux and D-Bus"
arch=('any')
url="https://github.com/alexdelorenzo/cast_control"
license=('AGPL3')
depends=('python-aiopath>=0.5.8' 'python-appdirs' 'python-click' 'python-daemons=1.3.2'
         'python-gobject' 'python-mpris_server>=0.4.0' 'python-mpris_server<0.5.0'
         'python-pychromecast=9.2.0' 'python-pydbus' 'python-typing_extensions')
makedepends=('python-setuptools')
optdepends=('playerctl: Get the D-Bus name for your device'
            'gnome-shell-extension-mpris-indicator-button: MPRIS indicator for GNOME')
conflicts=('chromecast_mpris')
replaces=('chromecast_mpris')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5af538e145c91d2bc3c3e36706f3b693d24797e68174e06d5efb229e9ab65fbf')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
