# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cast_control
pkgver=0.10.5
pkgrel=1
pkgdesc="Control Chromecasts from Linux and D-Bus"
arch=('any')
url="https://github.com/alexdelorenzo/cast_control"
license=('AGPL3')
depends=('python-aiopath' 'python-appdirs' 'python-click' 'python-daemons=1.3.2'
         'python-gobject' 'python-mpris_server=0.2.18' 'python-pychromecast=9.1.2'
         'python-pydbus')
makedepends=('python-setuptools')
optdepends=('playerctl: Get the D-Bus name for your device'
            'gnome-shell-extension-mpris-indicator-button: MPRIS indicator for GNOME')
conflicts=('chromecast_mpris')
replaces=('chromecast_mpris')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0c7cf0eafd2d7fc5ea17d960c33a0b00d588cf801560cf557b08337cc185a3f2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
