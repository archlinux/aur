# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: kagan <juanynie AT gmail DOT com>
# Contributor: Valheru <valheru AT facticius DOT net>
# Contributor: jackoneill

pkgname=qcomicbook
pkgver=0.9.1
pkgrel=1
pkgdesc="A reader of comic book archives"
url="https://github.com/stolowski/QComicBook"
arch=(i686 x86_64)
license=(GPL2)
depends=(qt5-x11extras poppler-qt5)
optdepends=('p7zip'
            'unace'
            'unrar'
            'rar')
makedepends=(cmake qt5-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stolowski/QComicBook/archive/$pkgver.tar.gz")
sha256sums=('39bb6ba0e20569985c930b0e8bdb19ae9c5453f27e9f7c01c6d44f56fb204619')

build() {
   cd "$srcdir/QComicBook-$pkgver"
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  
   make
}

package() {
   cd "$srcdir/QComicBook-$pkgver"
   make DESTDIR="$pkgdir" install
}
