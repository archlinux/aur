# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.12
pkgrel=2
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2-notify python2-httplib2 pyxdg python2-gconf python2-pycurl python2-socks python2-gtkspell hspell python2-keyring python2-oauth2 python2-numpy librsvg python2-dbus)
makedepends=(python2-setuptools)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver.tar.gz)

build() {
	cd "$srcdir"/Polly-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/Polly-$pkgver
	python2 setup.py install --skip-build -O1 --root="$pkgdir" --prefix=/usr
}

sha256sums=('376ae60067b192bc5d5147203f9116e207599f73929dfb8b6343be9f250ba410')
