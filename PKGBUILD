# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.11
_prealphaver=3.11
pkgrel=2
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2-notify python2-httplib2 pyxdg python2-gconf python2-pycurl socksipy python2-gtkspell hspell python2-keyring python2-oauth2 python2-numpy librsvg python2-dbus)
makedepends=(python2-setuptools)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver%20%28pre-alpha%20$_prealphaver%29.tar.gz)

build() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	python2 setup.py build
}

package() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	python2 setup.py install --skip-build -O1 --root="$pkgdir" --prefix=/usr
}

sha256sums=('c1e4c2d2c419626da484870e53866afdfbf14156bc2929f510c7f1142b457416')
