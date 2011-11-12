# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.0
_prealphaver=3.0
pkgrel=1
epoch=
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2-distribute python-notify python2-httplib2 pyxdg python2-gconf python-pycurl socksipy python2-gtkspell hspell python-keyring python2-oauth2 python2-numpy)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver%20%28pre-alpha%20$_prealphaver%29.tar.gz)

build() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

package() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	make DESTDIR="$pkgdir/" install
}

md5sums=('c489162ba53c309a1bcd1aa7768e3e9e')
