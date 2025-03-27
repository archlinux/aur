# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=abx
pkgver=0.2.b0
_pkgver=0.2-b0
pkgrel=1
pkgdesc="A simple ABX tester to compare audio files with GUI"
depends=("portaudio" "gtk3" "libsndfile")
arch=('i686' 'x86_64')
url="http://phintsan.kapsi.fi/abx.html"
license=('GPL3')
source=("http://phintsan.kapsi.fi/${pkgname}-${_pkgver}.tar.gz")
md5sums=('610a9c4ea408311a10e25775248b5727')

build() {
        cd "$srcdir/$pkgname-$_pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$_pkgver"
        make DESTDIR="$pkgdir/" install
}
