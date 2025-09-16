# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=abx
pkgver=0.2
pkgrel=1
pkgdesc="A simple ABX tester to compare audio files with GUI"
depends=("portaudio" "gtk3" "libsndfile")
arch=('i686' 'x86_64')
url="http://phintsan.kapsi.fi/abx.html"
license=('GPL3')
source=("http://phintsan.kapsi.fi/${pkgname}-${pkgver}.tar.gz")
md5sums=('8fd2417e1e8bbd54264db8819e7dad16')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
