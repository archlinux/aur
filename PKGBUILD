# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.10
_prealphaver=3.10
pkgrel=1
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2-notify python2-httplib2 pyxdg python2-gconf python2-pycurl socksipy python2-gtkspell hspell python2-keyring python2-oauth2 python2-numpy librsvg)
makedepends=(python2-distribute)
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

sha256sums=('629c2d04cfd9b925029090799093a45be03b7d9cd2bf2cbd37027ddf7744e5dd')
