# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cast_control
pkgver=0.11.8
pkgrel=1
epoch=1
pkgdesc="Control Chromecasts from Linux and D-Bus"
arch=('any')
url="https://github.com/alexdelorenzo/cast_control"
license=('AGPL3')
depends=('python-aiopath' 'python-appdirs' 'python-click' 'python-daemons'
         'python-gobject' 'python-mpris_server' 'python-pychromecast'
         'python-pydbus' 'python-typing_extensions')
makedepends=('python-setuptools')
optdepends=('playerctl: Get the D-Bus name for your device'
            'gnome-shell-extension-mpris-indicator-button: MPRIS indicator for GNOME')
conflicts=('chromecast_mpris')
replaces=('chromecast_mpris')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fc7b2207e2a192c320c9e640a4e7c18dbcd1d1e8e3be3341b715f9bbb0192df9')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
