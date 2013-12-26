# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=enventor
pkgver=0.1.0
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-${pkgver%.0}.tar.gz")
sha256sums=('b63fb458700e7d0bee5306fbabacc9d07d08edd60a80b994367dccb2c6a4e014')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
