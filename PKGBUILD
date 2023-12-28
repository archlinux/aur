# Maintainer: Aline Abler <alinea@riseup.net>
# Contributor: Jason Gerecke <killertofu@gmail.com>


pkgname=i4oled
pkgver=1.3
pkgrel=3
pkgdesc="Utility to set and render OLED icons on Wacom Intuos4 family tablets."
arch=('i686' 'x86_64')
url="https://gitlab.com/PrzemoF/i4oled"
license=('GPL3')
depends=('pango>=1.29.0' 'cairo>=1.10.0' 'libpng')
makedepends=('git')
source=("git+https://gitlab.com/PrzemoF/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
      cd "$srcdir/$pkgname"
        ./autogen.sh
          ./configure --prefix=/usr
            make
}

package() {
      cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir" install
}
