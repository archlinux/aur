# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=abx
pkgver=0.1
_pkgver=0.1
pkgrel=1
pkgdesc="A simple ABX tester to compare audio files with GUI"
depends=("portaudio" "gtk2" "libsndfile")
arch=('i686' 'x86_64')
url="http://phintsan.kapsi.fi/abx.html"
license=('GPL3')
source=("http://phintsan.kapsi.fi/${pkgname}-${_pkgver}.tar.gz")
md5sums=('8c920831b49aca7cc798f1d27d51cc7e')

build() {
        cd "$srcdir/$pkgname-$_pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$_pkgver"
        make DESTDIR="$pkgdir/" install
}
