# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.92.3
pkgrel=2
epoch=
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts."
arch=(x86_64 i686)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2 python-notify python2-httplib2 pyxdg python2-gconf python-pycurl socksipy python2-gtkspell hspell python-keyring python2-oauth2 python2-numpy)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver%20%28pre-alpha%202.3%29.tar.gz)

build() {
	cd "$srcdir/Polly-$pkgver (pre-alpha 2.3)"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

package() {
	cd "$srcdir/Polly-$pkgver (pre-alpha 2.3)"
	make DESTDIR="$pkgdir/" install
}

md5sums=('1d4976dfb9bb06d5d4539e1376d191a1')
