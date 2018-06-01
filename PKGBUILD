# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=xfce4-equake-plugin
pkgver=1.3.8.1
pkgrel=1
pkgdesc="Equake monitors and displays earthquakes in your Xfce panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://sourceforge.net/projects/equake/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
install="${pkgname}.install"
source=(https://sourceforge.net/projects/equake/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('32378cfcc741c024fa2dccc50f0b303039968761e81e211bac7e225dc4868295')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
