# Maintainer: Anastasios Vacharakis <archlinux@vacharakis.de>
pkgname=xmppcd-git
pkgver=1.0
pkgrel=1
pkgdesc="Small XMPP client daemon for use in embedded systems ( OpenWRT etc. )."
arch=('i686' 'x86_64')
url="https://github.com/stanson-ch/xmppcd"
license=('GPL')
depends=('libstrophe')
source=("$pkgname-$pkgver::git+https://github.com/stanson-ch/xmppcd.git")
md5sums=("SKIP")

build() {
        cd "$srcdir/$pkgname-$pkgver"
	autoreconf --install
	./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
