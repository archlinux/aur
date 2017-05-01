# Maintainer: Aline Abler <alinea@riseup.net>
# Contributor: Jason Gerecke <killertofu@gmail.com>


pkgname=i4oled
pkgver=1.3
pkgrel=1
pkgdesc="Utility to set and render OLED icons on Wacom Intuos4 family tablets."
arch=('i686' 'x86_64')
url="https://github.com/PrzemoF/i4oled"
license=('GPL3')
depends=('pango>=1.29.0' 'cairo>=1.10.0' 'libpng')
source=("https://github.com/PrzemoF/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3477a07133fe7d0f7b629b0b1a8d7cdc')

build() {
      cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
          ./configure --prefix=/usr
            make
}

package() {
      cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
