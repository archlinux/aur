# Maintainer: David Zmick <dpzmick@gmail.com>
pkgname=jack-keyboard
pkgver=2.5
pkgrel=1
epoch=0
pkgdesc="Virtual MIDI keyboard that uses JACK MIDI."
arch=('x86_64' 'i686')
url="http://jack-keyboard.sourceforge.net/"
license=('BSD')
depends=('jack' 'gtk2')
# makedepends=()
optdepends=('lash: integrate with lash session management') # TODO what?
options=(makeflags buildflags)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=("030a666f1703ef1ab3eae6004cb04a9a")
# validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    ./configure --prefix /usr
}

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make install DESTDIR=${pkgdir}
}
