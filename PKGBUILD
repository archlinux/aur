# Maintainer: qwence <queen.wenceslas@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Ian Yang <me@iany.me>

pkgname=gpicker
pkgver=2.3
pkgrel=1
pkgdesc="A program that allows you to quickly and conveniently pick file in a (possibly very large) project"
arch=(i686 x86_64)
url=http://savannah.nongnu.org/projects/$pkgname
license=(GPL3)
depends=(gtk2)
options=(!libtool)
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('565b39aaca0e6d3b824eaa3f589200c6ac16abfb2377a82d923e3d47c43f9a4b')
sha512sums=('5baa2db70db1af42febd32c5b008d9c003e9d2546befe780308e815a0f679a8dc984c0cd844adc69d1b9a5515609a372c640d02e8590e594032dbe72a955b8d2')

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

